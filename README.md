<div align="center">
    <img src="https://www.hn.cl/wp-content/uploads/2020/11/BDM-1.png" width="300px"> </img> 
    
<!-- Encabezado -->
## IS-501 | Bases de Datos I
### III PAC 2020  
### Seccción 0900
### Catedratico **Ing. José Manuel Inestroza**

### Estudiante 
| Nombre | Numero De Cuenta | Correo Institucional |
|:-------------:| :-----:|:-----:|
| Edgar Josué Benedetto Godoy | `20171033802` | [UNAH](mailto:edgar.benedetto@unah.hn) |

</div>

_______
_______

### Generalidades de la Asignatura

| Nombre | Detalle |
|:------:|:-------:|
| Nombre de la asignatura | IS-501 Base de Datos I |
| Nombre corto de la asignatura | IS-501 BDI |
| Requisitos | MM-401 Estadística | 
| Requisitos | MM-202 Cálculo II |
| Requisitos | MM-201 Cálculo I |
| Requisitos | MM-110 Matemáticas I |
| Requisitos | MM-111 Geometría y Trigonometría |
| Requisitos | IS-410 Programación Orientada a Objetos |
| Requisitos | IS-310 Algoritmos y Estructuras de Datos |
| Requisitos | IS-210 Programación II |
| Requisitos | MM-314 Programación I |
| Requisitos | MM-110 Matemática I |
| Requisitos | IS-110 Introducción a la Ingeniería en Sistemas |
| Unidades Valorativas | 5 U.V. |
| Horario de Clase | 5 horas semanales, 1 hora diaria por sección | 
| Sección | 0900 | 
| Horas de Estudio | Mínimo 10 horas diarias fuera del horario de clase, distribuidas entre Lunes a Sabado, por cada semana del periodo académico. Normas de educación superior, inciso B) Unidad de Medida Académica, Artículo 59 y Artículo 60, La unidad valorativa o crédito, representa un esfuerzo académico real de tres (3) horas así: a) Por una (1) hora  académica con el catedrático, más dos (2) horas de preparación o trabajo académico individual. [Normativa UNAH](https://des.unah.edu.hn/repositorio/normativa) 

### Objetivos Generales
* Esta materia desea activar en el estudiante el camino de las tecnologías de información y de las ciencias de la computación para conocer los fundamentos de las Bases de Datos. Para ello, los objetivos generales de la clase son:

* Generar la comprensión de la teoría de base de datos para modelar situaciones de la vida real con base a la interacción entre casos de uso y actores involucrados.
Diversificar la capacidad del estudiante en el área de las ciencias de la computación, mediante la programación y estudio de los Base de Datos, que apliquen los diferentes modelos conceptuales.

### Objetivos Específicos

* Describir los conceptos generales de diseño de esquemas conceptuales de las bases de datos mediante modelos y paradigmas (ER, Relacional, Orientado a Objetos, NoSQL).
Aplicar los fundamentos matemáticos, principios algorítmicos y teorías de ciencias de la computación en la modelación y diseño de soluciones informáticas asociadas con los Base de Datos.
* Identificar las funciones, características, estructura e implementación de un modelo de SGBD Relacional.
* Implementar los procesos de reestructuración y optimización de bases de datos mediante las reglas de normalización.
* Aplicar la habilidad desarrollada en los Ingenieros en Sistemas para el análisis sistemático y para la resolución de problemas mediante las tecnologías de Bases de Datos, bajo los conceptos el diseño, recolección y procesamiento de datos.

### Contenidos Generales
| Unidad | Contenido |
|:------:|:---------:|
| **Unidad I** | Introducción, conceptualización, modelado, implementación y SQL |
| **Unidad II**| Triggers, funciones, procedimientos y otras sentencias SQL |

______

<br>

## Materiales y Recursos didácticos

### Herramientas de Software
* Sistema Operativo Linux Debian 10 (Buster), en compatibilidad con Linux Ubuntu 16.04 LTS y Linux Ubuntu 18.04 LTS.
    1. [Linux Debian](https://www.debian.org/releases/buster/) 
    2. [Linux Ubuntu](http://releases.ubuntu.com) 

* Puede hacer uso de Virtual Box para instalar su propia máquina virtual con Linux, o puede usar Linux como Dual-Boot.
    1. [Virtual Box](http://virtualbox.org)
* Para las demostraciones de base de datos en Linux Android, se usará la versión vigente de Termux. Las demostraciones en clase se harán sobre Android 9.
    1. [Termux](https://termux.com/) 
* El editor secundario que se usará en clase será Visual Studio Code en su versión más reciente para 64-bits.
    1. [Visual Studio Code](http://code.visualstudio.com)
    
* El navegador web que se usará para algunas demostraciones en Mozilla Firefox versión 77.0.1 o superior. Cada estudiante se hará responsable de su propia configuración e instalación para los siguientes componentes de programación:
* Python:
  * Linux Debian 10 (Buster): versión 3.7.3
  * Linux Android: versión 3.8.5
  * Linux Raspberry Pi: versión 3.7.3
  * GNU Bash.
  * Linux Debian 10 (Buster): versión 5.0.3
  * Linux Android: versión 5.0.18
  * Linux Raspberry Pi: versión 5.0.3
* SGBD:
    * Linux Debian 10 (Buster):
    * MariaDB versión 10.3.23, o
    * MySQL versión 5.7
#### Comando:
```
$ sudo apt install default-mysql-server
```
* Linux Android:
    * MariaDB versión 10.5.5, o
    * MySQL versión 8.0
#### Comando:
```
$ apt install mariadb
```
* Linux Raspberry Pi:
  * MariaDB versión 10.3.23, o
  * MySQL versión 5.7


#### Comando:
```
$ sudo apt install default-mysql-server
```

* MySQL Workbench Community:
    * Versión 8.0.21-1ubuntu
* Visual Studio Code Markdown Extension: docsmsft.docs-markdown
* Visual Studio Code Sublime Text Keymap: ms-vscode.sublime-keybindings

### Libros y contenido de Apoyo
1. Bash Reference Manual, 5th Edition, Bash 2019.

   * [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

2. Manual de Referencia de MySQL Community Edition 5.7
   * [Bash Reference Manual Refman](https://dev.mysql.com/doc/refman/5.7/en/)
3. Manual de Referencia de MySQL Workbench.
   * [Bash Reference Manual Workbench](https://dev.mysql.com/doc/workbench/en/)
4. Termux, Official Website.
   * [Termux](https://termux.com/)
   * [Termux MariaDB](https://wiki.termux.com/wiki/MariaDB)
   * [Termux Remote Access](https://wiki.termux.com/wiki/Remote_Access) 
5. DBMS MariaDB, Official Website.
   * [DBMS MariaDB](https://mariadb.org/)
   * [DBMS MariaDB About](https://mariadb.org/about/)
   * [DBMS MariaDB Documentation](https://mariadb.org/documentation/)
   * [DBMS MariaDB VS MySQL](https://mariadb.com/kb/en/mariadb-vs-mysql-compatibility/)
6. DBMS MySQL Community Server Edition, Official Website.
   * [DBMS MySQL](https://dev.mysql.com/)
   * [DBMS MySQL Refman](https://dev.mysql.com/doc/refman/5.7/en/)
   * [DBMS MySQL Workbench](https://dev.mysql.com/doc/workbench/en/)
7. Sitio oficial de Jupyter Notebook/Lab.
   * [Jupyter Notebook](https://jupyter.org/)
   * [Jupyter Notebook Install](https://jupyter.org/install)
   * [Jupyter Notebook Running](https://jupyter.readthedocs.io/en/latest/running.html#running)
   * [Jupyter Notebook Get Start](https://jupyterlab.readthedocs.io/en/latest/getting_started/starting.html)
8. Sitio oficial de Python 3.5
   * [Python 3.5](https://docs.python.org/3.5/)
9. MySQL Usando Python (tutorial de apoyo).
   * [MySQL Usando Python](https://www.w3schools.com/python/python_mysql_getstarted.asp)

_____

<br>

### Criterios de Evaluación

#### Generales

| Parte | Puntaje | 
|:-----:|:-------:|
| Parte I (Unidad I de Aprendizaje) | Corresponde con el 50% del total de la materia |
| Parte II (Unidad II de Aprendizaje) | Corresponde con el 50% del total de la materia |

<br>

#### Especificos

| Parte | Actividad | Puntaje | 
|:-----:|:---------:|:-------:|
| I | Examen 1 práctico | 50% |
| I | Examen 2 teórico y definiciones prácticas | 50% |
| II | Examen 3 práctico | 45% |
| II | Tarea práctica, resumen, informe u otros | 10% |
| II | Proyecto Final | 45% |

