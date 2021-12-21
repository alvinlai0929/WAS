#INSATLL install Manger
chmod -R 777 /source/IM/IM192
./installc -acceptLicense

#was source 
/source/WAS/90501

#install manager Path
/opt/IBM/InstallationManager/eclipse/tools
imcl -c

To uninstall Installation Manager from Linux, complete the following steps:
Open a terminal window and run /var/ibm/InstallationManager/uninstall/uninstall if this was an installation by root.
In the IBM Installation Manager Uninstall Packages wizard, click Next; then click Uninstall.
#uninstall Installation Manager  以下這個可以用
/var/ibm/InstallationManager/uninstall/uninstallc


#update Installation Manager  
Start Installation Manager.
Click File > Preferences.
On the Repositories tab, select Search service repositories during installation and updates.
Click Updates and then click Search for Installation Manager updates.
Click OK.
Click Update.
Installation Manager searches for updates to itself. If a later version is found, you are prompted to update Installation Manager. For version information, click Details.
Click Yes.
#source 


#check package
./imcl listAvailablePackages \
-repositories /source/WAS/90501/was/90501base/repository.config 

com.ibm.websphere.BASE.v90_9.0.5001.20190828_0616

./imcl listAvailablePackages \
-repositories /source/WAS/90501/was/sdk8035java8aix/repository.config 

com.ibm.java.jdk.v8_8.0.5035.20190422_0948




#installPackage
./imcl install com.ibm.websphere.BASE.v90_9.0.5001.20190828_0616 com.ibm.java.jdk.v8_8.0.5035.20190422_0948 \
-repositories /source/WAS/90501/was/90501base/repository.config,/source/WAS/90501/was/sdk8035java8aix/repository.config \
-acceptLicense \
-sp


#create server1 注意主機名稱 不要有特殊符號或空格
./manageprofiles.sh -create \
-templatePath /usr/IBM/WebSphere/AppServer/profileTemplates/default \
-profileName AppSrv01 \
-profilePath /usr/IBM/WebSphere/AppServer/profiles/AppSrv01 \
-enableAdminSecurity true \
-adminUserName wasadmin \
-adminPassword wasadmin 

INSTCONFSUCCESS: Success: Profile AppSrv01 now exists. 
Please consult /usr/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/AboutThisProfile.txt 
for more information about this profile.


# WSVR0244E: An undefined HOST product variable has been encountered in the krb5Spn property of the /usr/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells/nullNode01Cell/security.xml#KRB5_1 configuration object.
#無法啟動時，
#檢查 /etc/hosts  是否設定正確



#Update was

./imcl updateAll -repositories /source/WAS/FIX/ifph42728/repository.config -acceptLicense -sp



#設定 alias, 說明: alias Name=String

alias startwas1=/usr/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startServer.sh server1
