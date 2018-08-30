# build
docker build -t cx_mfg_yocto . 

# run
docker run -v /home/nathan/cx/codebase/fsl-release-bsp/:/home/yocto/ -i -t --name cx_mfg_yocto_01 cx_mfg_yocto bash 

# resume
docker start -i -a cx_mfg_yocto_01 

# remove
docker container rm cx_mfg_yocto_01 
