import tkinter as tk
from tkinter import ttk
from src.services.mes import login_jmmes, get_product_id, get_line_id, get_produced_quantity
from src.tools.read_config import read_config

class VentanaInfo(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Para el cambio")
        self.geometry("400x200+20+20")  # tamaño y posición (esquina superior izquierda)
        self.attributes("-topmost", True)
        self.resizable(False, False)
        self.configure(bg="white")  # Fondo blanco
        self.overrideredirect(True)

        # Hacer la ventana movible
        self.bind("<ButtonPress-1>", self.start_move)
        self.bind("<B1-Motion>", self.do_move)

        # Contenedor principal para centrar el contenido
        self.container = tk.Frame(self, bg="white")
        self.container.pack(expand=True, fill="both")  # Centrar el contenido
        
        self.boton_cerrar = tk.Button(self.container, text = "X", command=self.destroy, bg="white", fg="black", borderwidth=0, font=("Arial", 12), cursor="hand2")
        self.boton_cerrar.place(x=370, y=5, width=20, height=20)

        # Etiquetas
        self.label_producidos = ttk.Label(
            self.container, text="Pasaron por el primer puesto: ---", font=("Arial", 15), background="white", foreground="black"
        )
        self.label_producidos.pack(pady=(50, 10))  # Margen superior más grande para centrar verticalmente

        self.label_faltantes = ttk.Label(
            self.container, text="Faltan: ---", font=("Arial", 15), background="white", foreground="black"
        )
        self.label_faltantes.pack(pady=(10, 50))  # Margen inferior más grande para centrar mejor

        # Iniciar login y actualización de datos
        self.iniciar_datos()
       
    def start_move(self, event):
        """Inicia el movimiento de la ventana."""
        self._x = event.x
        self._y = event.y

    def do_move(self, event):
        """Realiza el movimiento de la ventana."""
        x = self.winfo_x() + event.x - self._x
        y = self.winfo_y() + event.y - self._y
        self.geometry(f"+{x}+{y}")

    def iniciar_datos(self):
        login_jmmes()
        self.modelo = read_config("MODEL")
        self.linea = read_config("LINE")
        self.fecha_inicio = read_config("FechaInicio")
        self.cantidad_total = int(read_config("ProduccionTotal"))

        self.product_id = get_product_id(self.modelo)
        self.line_id = get_line_id(self.linea)

        self.actualizar_datos()

    def actualizar_datos(self):
        try:
            producidos = get_produced_quantity(self.product_id, self.line_id, self.fecha_inicio)
            faltantes = self.cantidad_total - producidos

            self.label_producidos.config(text=f"Pasaron por el primer puesto: {producidos}")
            self.label_faltantes.config(text=f"Faltan: {faltantes}")
        except Exception as e:
            self.label_producidos.config(text="Error obteniendo datos")
            self.label_faltantes.config(text=str(e))

        # Repetir cada 5 segundos
        self.after(5000, self.actualizar_datos)