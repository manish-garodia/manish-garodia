@echo off

taskkill /F /IM acrotray.exe
taskkill /F /IM mydesktopservice.exe
taskkill /F /IM OracleContent.exe
taskkill /F /IM OracleContentUI.exe
taskkill /F /IM VMware.IntelligentHub.CommunicationService.exe
taskkill /F /IM VMware.IntelligentHub.UI.exe
taskkill /F /IM VMwareHubHealthMonitoring.exe

timeout /t 30