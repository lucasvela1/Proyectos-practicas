function sumar(a,b){
    return a + b;
}

console.log(sumar(2,3)); // 5

function esPar(num){
    return num % 2 === 0;
}

console.log(esPar(4)); // true
console.log(esPar(5)); // false

function esMayor(a, b){
    if (a>b){
        return a;
    }else if (a<b){
        return b;
    }else{
        return "Son iguales";
    }        
};

console.log(esMayor(5, 3)); // 5
console.log(esMayor(2, 4)); // 4
console.log(esMayor(3, 3)); // "Son iguales"

const numeros = [1, 2, 3, 4, 5];

function contarArray(arreglo){
    for (let i=0; i<arreglo.length; i++){
        elementos+=1;
    }
    return elementos;
}

console.log(contarArray(numeros)); // 5

function sumarArray(arreglo){
    let suma=0;
    for (let i=0; i<arreglo.length; i++){
        suma+=arreglo[i];
    }
}

console.log(sumarArray(numeros)); // 15

function mayorArray(arreglo){
    let mayor=arreglo[0];
    for (let i=1; i<arreglo.length; i++){
        if (arreglo[i]>mayor){
            mayor=arreglo[i]
        }
    }
}

console.log(mayorArray(numeros)); // 5

function sinRepetidos(arreglo){
    const setRepetidos = new Set(arreglo);
    for (let i=0; i<arreglo.length; i++){
        setRepetidos.add(arreglo[i]);    
    }
    const sinRepetir=[];
    for 
}