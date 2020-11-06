# Folium

El repositorio correspondiente a esta lección está disponible en [https://github.com/tpb708-programacionsig-2020/leccion-10-folium/](https://github.com/tpb708-programacionsig-2020/leccion-10-folium/). Se recomienda bifurcarlo a su cuenta en GitHub.

## Notebooks
- [Folium](https://github.com/tpb708-programacionsig-2020/leccion-10-folium/blob/master/folium.ipynb)
- [Folium - mapas de coropletas](https://github.com/tpb708-programacionsig-2020/leccion-10-folium/blob/master/folium-coropletas.ipynb)

## Visualización de notebooks
Con el sitio [nbviewer](https://nbviewer.jupyter.org/):
- [Folium](https://nbviewer.jupyter.org/github/tpb708-programacionsig-2020/leccion-10-folium/blob/main/folium.ipynb)
- [Folium - mapas de coropletas](https://nbviewer.jupyter.org/github/tpb708-programacionsig-2020/leccion-10-folium/blob/main/folium-coropletas.ipynb)

## Creación de un ambiente Conda y clonación del repositorio
Ejecute estos comandos desde la línea de comandos de Anaconda, en el directorio en el que desea almacenar el repositorio clonado.
```shell
# Actualización de Conda
conda update -n base -c defaults conda

# Creación del ambiente
conda create -n leccion-10

# Activación del ambiente
conda activate leccion-10

# Instalación de módulos
conda config --env --add channels conda-forge
conda config --env --set channel_priority strict
conda install -c anaconda pandas folium jupyter

# Clonación del repositorio (debe sustituir la palabra "usuario" por su nombre de usuario en GitHub)
git clone https://github.com/usuario/leccion-10-folium.git
cd leccion-10-folium

# Ejecución de Jupyter Notebook
jupyter notebook

# Actualización del repositorio y de los archivos GeoJSON generados
$ git add .
$ git commit -m "Actualizar notebook"
$ git push

# Desactivación del ambiente Conda
$ conda deactivate
```
