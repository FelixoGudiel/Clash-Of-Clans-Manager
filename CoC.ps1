
Set-Location -Path "C:\Users\felix\Clash-Of-Clans-Manager"

# Define the Java command to execute
$javaCommand = "& 'C:\Program Files\Eclipse Adoptium\jdk-21.0.4.7-hotspot\bin\java.exe' '@C:\Users\felix\AppData\Local\Temp\cp_b2cjrr3126btugl951hisxb2d.argfile' 'com.japarejo.springmvc.SpringMvcApplication'"

# Ejecutar el comando en un nuevo proceso y esperar unos segundos para asegurarse de que se inicie
Start-Process powershell -ArgumentList "-NoExit", "-Command", $javaCommand
Start-Sleep -Seconds 5

# Abrir Firefox apuntando a localhost:8080
Start-Process "firefox.exe" "http://localhost:8080"
