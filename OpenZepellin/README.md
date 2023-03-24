# Demo Smart Contracts Standards

Este proyecto muestra el uso básico de la librería de contratos de OpenZeppelin.

Esta compuesto por un contrato de ejemplo `contracts/MyToken.sol`, un test para el contrato en `test/MyToken.js` y un script para desplegar el contrato `scripts/deploy.js` en la red de prueba.

Este proyecto utiliza:

- [Node](https://nodejs.org/en)
- [Hardhat](https://hardhat.org/)

## Table of content

- [🔩 Requerimientos](#requerimientos)
- [🏄 Empezar](#empezar)
- [📄 Documentación](#documentacion)
- [🤝 Contribuir](#contribuir)


## 🔩 Requerimientos

Necesitas tener instaladas estas herramientas para ejecutar este proyecto:

- [Node](https://nodejs.org/en)
- Editor de código de tu preferencia

## 🏄 Empezar

Para iniciar tu ambiente de desarrollo local en la terminal debes ejecutar estos comandos:

1. Clonar repositorio e instalar las dependencias:

- **Clonar el repositorio**:

```bash
git clone git@github.com:natachadelarosa/smart-contracts-standards.git
```
- **Cambiar al directorio del proyecto**:
```bash
cd smart-contracts-standards
```

- **OPCIONAL: si usas nvm para manejar tus versiones de Node.js:**
```bash
nvm use stable #OPCIONAL
```

- **Instalar las dependencias:**
```bash
npm install
```

2. En la terminal ejecuta el siguiente comando para ejecutar la red de prueba:

```bash
npx hardhat node  
```

3. Deja ejecutando el nodo y en otra terminal ejecuta el comando:

```bash
npx hardhat test
```
Para ejecutar las pruebas del contrato

4. Para desplegar el contrato en la red de prueba ejecuta el comando:

```bash
npx hardhat run scripts/deploy.js
```

Para aprender más sobre los comandos disponibles en hardhat puedes usar el comando:

```bash
npx hardhat help
```

## 📄 Documentación

#### Estructura de un contracto inteligente

Vamos a desglosar los diferentes componentes de un contrato inteligente:

- **Pragma:** esta es una directiva del compilador que especifica la versión de Solidity utilizada en el contrato. Por lo general, se incluye al comienzo del código del contrato.

- **Definición de contrato:** este es el cuerpo principal del contrato, que contiene las variables de estado, los eventos, el constructor y las funciones. El contrato se define mediante la palabra clave contract, seguida del nombre del contrato.

- **Variables de estado:** Estas son variables que almacenan el estado del contrato, y pueden ser leídas y modificadas por funciones dentro del contrato. En este ejemplo, tenemos una variable de estado myVariable de tipo uint256.

- **Eventos:** Sirven para emitir señales del contrato que pueden ser captadas por aplicaciones externas. En este ejemplo, tenemos un evento MyEvent que se emite cada vez que se cambia el valor de myVariable.

- **Constructor:** esta es una función especial que se llama cuando el contrato se implementa en la cadena de bloques y se usa para inicializar las variables de estado del contrato. En este ejemplo, tenemos un constructor que establece el valor inicial de myVariable.

- **Funciones:** Estas se utilizan para definir el comportamiento del contrato, y pueden ser llamadas externamente por otros contratos o aplicaciones. En este ejemplo, tenemos una función setVariable que modifica el valor de myVariable y emite el evento MyEvent.

**Ejemplo:**

```javascript
pragma solidity ^0.8.9;  // especifica la version de Solidity usada en el contrato

contract MyContract {
    // variables de estado
    uint256 public myVariable;

    // eventos
    event MyEvent(uint256 indexed myValue);

    // constructor
    constructor(uint256 initialValue) {
        myVariable = initialValue;
    }

    // funciones
    function setVariable(uint256 newValue) public {
        myVariable = newValue;
        emit MyEvent(myVariable);
    }
}
```

#### Como usar la librería de contratos de OpenZeppelin

**Instala OpenZeppelin:** Puedes instalar OpenZeppelin usando `npm` o `yarn`. También puedes descargar el código fuente directamente desde GitHub. Para instalar OpenZeppelin a través de `npm`, puede usar el siguiente comando:

```bash
npm install @openzeppelin/contracts
```

**Importe la librería:** una vez que se instala OpenZeppelin, puedes importar los contratos que deseas usar en tu contrato inteligente de Solidity. Puede hacerlo agregando una declaración de importación en la parte superior de su archivo Solidity. Por ejemplo, para importar el contrato ERC20 de OpenZeppelin, agregaría la siguiente declaración de importación:

```javascript
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
```

**Heredar la librería en mi contrato:** después de importar la librería, puedes usar su funcionalidad al heredarla desde tu contrato. Por ejemplo, para crear un nuevo token ERC20, puede crear un nuevo contrato que herede del contrato ERC20:

```javascript
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("My Token", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

## 🤝 Contribuir

Este proyecto sigue la especificación [all-contributors](https://github.com/all-contributors/all-contributors). Contribuciones de todo tipo son bienvenidas!

Si encuentras algún error en la documentación o en el código no dudes crear un [issue](https://github.com/natachadelarosa/smart-contracts-standards/issues) o mejor aún un [pull-request](https://github.com/natachadelarosa/smart-contracts-standards/pulls).