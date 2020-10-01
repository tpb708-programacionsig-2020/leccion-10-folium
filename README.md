# Folium

## Notebooks
- [Folium](https://github.com/tpb708-programacionsig-2020/leccion-10-folium/blob/master/folium.ipynb)

## Creación de un ambiente Conda y clonación del repositorio
```shell
# Actualización de Conda
conda update -n base -c defaults conda

# Creación de un ambiente de nombre "comandos-gdal"
conda create -n leccion-10

# Activación del ambiente
conda activate leccion-10

# Instalación de paquetes
# Jupyter
conda install -c anaconda jupyter
conda install folium -c conda-forge

# Clonación del repositorio
git clone https://github.com/tpb708-programacionsig-2020/leccion-10-folium.git
cd leccion-10

# Ejecución de Jupyter Notebook
jupyter notebook

# Actualización del repositorio y de los archivos GeoJSON generados
$ git add .
$ git commit -m "Actualizar notebook"
$ git push

# Desactivación del ambiente Conda
$ conda deactivate
```
