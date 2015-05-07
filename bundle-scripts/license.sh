#
# this copies license files from a license directory to your deploy folder
# change the destination folder to your portal-ee bundle
# change the license folder to where you keep your *developer-cluster-* licenses
#
#	license $version $remote-option
#	license 6120 [r|remote|-r]
#
# the remote option enables you to deploy the license to a staging and live server at the same time
# without re-typing the command
#

if [ -z "$1" ]; then
	echo "please specify license"
	return
fi

destination="/Users/andrewbetts/Desktop/servers/liferay-portal-ee/deploy/"
license="/Users/andrewbetts/Desktop/servers/licenses/"

if [ $1 = "6110" ]; then
	license+=license-portaldevelopment-developer-cluster-6.1ga1-liferaycom.xml
elif [ $1 = "6120" ]; then 
	license+=license-portaldevelopment-developer-cluster-6.1ga2-liferaycom.xml
elif [ $1 = "6130" ]; then
	license+=license-portaldevelopment-developer-cluster-6.1ga3-liferaycom.xml
elif [ $1 = "6210" ]; then
	license+=license-portaldevelopment-developer-cluster-6.2ga1-liferaycom.xml
fi

if [ ! -d $license ]; then
	echo "copying license $license"
	echo "to $destination"
	 cp "$license" "$destination"
else
	echo "no corresponding license file found, did you mean 6110, 6120, 6130, or 6210?"
fi

arg=$2

if [ -n "$arg" ]; then
	if [[ "$arg" = "r" || "$arg" = "remote" || "$arg" = "-r" ]]; then
    
		destination="/Users/andrewbetts/Desktop/servers/remote-portal-ee/deploy/"
		license="/Users/andrewbetts/Desktop/servers/licenses/"

		if [ $1 = "6110" ]; then
        		license+=license-portaldevelopment-developer-cluster-6.1ga1-liferaycom.xml
		elif [ $1 = "6120" ]; then
        		license+=license-portaldevelopment-developer-cluster-6.1ga2-liferaycom.xml
		elif [ $1 = "6130" ]; then
        		license+=license-portaldevelopment-developer-cluster-6.1ga3-liferaycom.xml
		elif [ $1 = "6210" ]; then
        		license+=license-portaldevelopment-developer-cluster-6.2ga1-liferaycom.xml
		fi

		if [ ! -d $license ]; then
        		echo "copying license $license"
        		echo "to $destination"
        	 	cp "$license" "$destination"
 		else
			echo "no corresponding license file found, did you mean 6110, 6120, 6130, or 6210?"
		fi
    fi
fi
