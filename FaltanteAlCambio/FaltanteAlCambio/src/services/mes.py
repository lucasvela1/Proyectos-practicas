import requests
import json
from datetime import datetime
from src.tools.read_config import read_config

API_MES = read_config("API_MES")

HEADERS = {
    "Content-Type": "application/json",
}

X_XSRF_TOKEN = ""
TOKEN = ""
COOKIE = ""

LINE_MAP = {
    "LCD6 - Montaje": 3,
    "LCD8 - Montaje": 10,
    "Celda - Montaje": 13,
    "Celda2-Montaje": 82,
    "Celda2-Accesorios": 83,
    "Celda Accesorios": 12,
    "LCD 6 - Accesorios": 14,
    "LCD 8 - Accesorios": 9,
} #Mapeo los posibles valores que puede venir de las lineas y los vinculo a su ID. Solo manejaremos Celda y las líneas de tv en este caso como posibles.

def login_jmmes():
    global X_XSRF_TOKEN, TOKEN, COOKIE

    try:
        print("Obteniendo XSRF token...")
        get_token = requests.get(f"{API_MES}/api/XsrfToken")

        antiforgery_token = get_token.cookies[".AspNetCore.Antiforgery.T8b4Fs--lAw"] #Cuando es por Request si se necesitan las cookies
        xsrf_token = get_token.cookies["XSRF-TOKEN"]

        X_XSRF_TOKEN = xsrf_token
        COOKIE = f".AspNetCore.Antiforgery.T8b4Fs--lAw={antiforgery_token}"

        headers = {
            "Content-Type": "application/json",
            "X-XSRF-TOKEN": xsrf_token,
            "Cookie": COOKIE, #El header que guardo completo en python incluye cookies
        }

        print("Enviando login...")
        payload = json.dumps({"name": "operador", "password": "0P3r4dOr"}) #Le envio como json el usuario y contraseña, igual que en postman
        r = requests.post(f"{API_MES}/api/User/Authenticate", data=payload, headers=headers)

        if r.status_code != 200: #El codigo 200 indica exito
            print("Error al autenticar:", r.status_code)
            print("Respuesta:", r.text)
            return

        TOKEN = r.json().get("token", "")
        print("Login exitoso. Token de sesión obtenido.")

    except Exception as e:
        print("Error durante el login:", e)


def get_product_id(modelo: str) -> int | None:
    print(f"Obteniendo ID para el modelo {modelo}...")
    url = f"{API_MES}/api/products/GetSingleByNameAsync/{modelo}"

    headers = {
        "X-XSRF-TOKEN": X_XSRF_TOKEN,
        "token": TOKEN   #Para conseguir la id necesito de los dos tokens
    }

    r = requests.get(url, headers=headers)
    print("Status code:", r.status_code)

    if r.status_code == 200:
        data = r.json()
        product_id = data.get("id")
        print("Product ID:", product_id)
        return product_id
    else:
        print("Acceso denegado. El token puede estar vencido o inválido.")
        print("Respuesta:", r.text)
        return None



def get_line_id(line_name):  #Con el nombre de la linea me devuelve la id, como una tabla Hash
    return LINE_MAP.get(line_name, None)


def get_produced_quantity(product_id, line_id, fecha_inicio):
    headers = {
        "X-XSRF-TOKEN": X_XSRF_TOKEN,
        "token": TOKEN #Necesito ambos tokens para ver la produccion
    }

    fecha_fin = datetime.now().strftime("%d-%m-%Y%%20%H:%M") #Consigo la fecha de hoy para obtener la última producción
    url = f"{API_MES}/api/producedQuantities/GetReport/1/{fecha_inicio}/{fecha_fin}"
    params = {
        "productId": product_id,
        "lineId": line_id
    }

    r = requests.get(url, headers=headers, params=params)

    if r.status_code == 200:
        try:
            data = r.json()
            estaciones = data[0][0]
            
            if line_id==3:   #LCD6 - Montaje
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "hermanado placa - pantalla": #Recorro las estaciones hasta encontrar el puesto de Hermanado. Nos interesa porque es el primero, y apenas termine su produccion comienza el cambio
                      return est["count"]
            elif line_id==10:    #LCD8 - Montaje
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "pantalla - placa 1":  
                      return est["count"]
            elif line_id==14:    #Accesorios LCD6
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "puesto 1": 
                      return est["count"]         
            elif line_id==9:    #Accesorios LCD8
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "balanza": 
                      return est["count"]   
            elif line_id==13:    #Celda Montaje
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "hermanado placa - pantalla": 
                      return est["count"]     
            elif line_id==12:    #Celda Accesorios
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "puesto 1": 
                      return est["count"]
            elif line_id==82:    #Celda2 Montaje
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "hermanado placa - pantalla": 
                      return est["count"]
            elif line_id==83:    #Celda2 Accesorios
                   for est in estaciones:
                    if est["stationGroupName"].lower() == "puesto 1": 
                      return est["count"]  
            print("No se encontró la estación correspondiente.")
            print("Product ID:", product_id)
            print("Line ID:", line_id)
            print("Fecha inicio:", fecha_inicio)
            return 0

        except Exception as e:
            print("Error procesando la respuesta:", e)
            return 0
    else:
        print("Error al obtener producción por estación:", r.status_code)
        print("Respuesta:", r.text)
        return 0

