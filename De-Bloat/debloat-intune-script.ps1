$DebloatFolder = "C:\ProgramData\Debloat"
If (Test-Path $DebloatFolder) {
    Write-Output "$DebloatFolder exists. Skipping."
}
Else {
    Write-Output "The folder '$DebloatFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$DebloatFolder" -ItemType Directory
    Write-Output "The folder $DebloatFolder was successfully created."
}

$templateFilePath = "C:\ProgramData\Debloat\removebloat.ps1"

Invoke-WebRequest `
-Uri "https://raw.githubusercontent.com/HJSTechnology/HJSPublic/main/De-Bloat/RemoveBloat.ps1" `
-OutFile $templateFilePath `
-UseBasicParsing `
-Headers @{"Cache-Control"="no-cache"}


##Populate between the speechmarks any apps you want to whitelist, comma-separated
$arguments = ' -customwhitelist ""'


invoke-expression -Command "$templateFilePath $arguments"

# SIG # Begin signature block
# MIIFuQYJKoZIhvcNAQcCoIIFqjCCBaYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAEIKc32NBZ8G25
# fvMH5CYW/gSE0rakdjaXmD/Cn3bqqqCCAyIwggMeMIICBqADAgECAhB+yH3x4K5/
# qESY4vt/nEyBMA0GCSqGSIb3DQEBCwUAMCcxJTAjBgNVBAMMHFBvd2VyU2hlbGwg
# Q29kZSBTaWduaW5nIENlcnQwHhcNMjUwNTAxMTYwMjU0WhcNMjYwNTAxMTYyMjU0
# WjAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvuT45oaKGenSLQKx7j1snVy+YFOD
# rlvdUsbYUQPymhK0wkgBMjTTXRfz/HgC5EC7SctCgjZFLJof8CfPasBErVriUtNi
# PC4NUFn65HgTHCdrZwkr+IH8kXc6V0dvolSBrPtU+4lSwkJL8aeD55yEYZxNpIx8
# J84LabbfQN4GMsHO6tzEo7mfdo4f0IJsHzCrUPT+hV+EENDMKGWTEgMX02a0HVzm
# GXCPLpt0R4MhgDZMl0LnTkG2mOQJqyGrKPisC8nsElR/s/TiVkApeUd9/oqh9Fx2
# wB2RwGlfN82qtk8E+OQNOaWDt4cChunw9qiqr20lYRpRkYIonVKJn3TbuQIDAQAB
# o0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0O
# BBYEFFxreCGPKkYlHaUMaBvMfqLRxJTaMA0GCSqGSIb3DQEBCwUAA4IBAQATKEQI
# Bz4m0HXatjHWRNUR+AcI1A9fZQj+NtbHu8M0HJMKBX8yspasDjFo5r6FnjFLOPaQ
# 43tzEreHmd4piwGu4pYDo2Yf0Aat9TKM/ygDFFBTsbwD2nGt8yIMbHakAJBe+5O/
# O/b5he2PiI7RWKIpWgPRDELvn5UYmSEuNx/nJ7f3MtT03rElefSjoJehpo6uM22y
# 6LNpYTUKdYKAHL98gdwY+VAfQypZFpKAkTr9BfVHaXmhdhOy6OupUw2wEc/Ztfpa
# UQQj7QcQEi1yMBpyNN/fPnTwRDowXYowDHyNAoaJtyKFNlo/4XFqGoCsOiUvYsql
# 0PXLR6Hvxl8hrszZMYIB7TCCAekCAQEwOzAnMSUwIwYDVQQDDBxQb3dlclNoZWxs
# IENvZGUgU2lnbmluZyBDZXJ0AhB+yH3x4K5/qESY4vt/nEyBMA0GCWCGSAFlAwQC
# AQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZI
# hvcNAQkEMSIEIDrkRNOrN2ImZVfnrzP6zxrGDn6z14YU9iyI7WssKQhGMA0GCSqG
# SIb3DQEBAQUABIIBADV1f3c7D+bRyiaog+s2zfGSQbCGm52ZlNXxe56Hwqgu/5FX
# s4CaeLdVcU4TiMYYNpO/kmj/1ltKEUmHohC+7rFBc+xQB1a6ex0gGtJKTKQWngAH
# TxK2FpSfaRlYveIIvkSCbZJ5kbEin00nt17tPr6bEOPWrsSa2jV26kypTBwfFFDr
# CuGifyVoJYlnKNtuLKUxtccsxofE9pAAe5T8dzC8mcJyWKplqbg9uDMj7bqvZ9Kr
# XebDDIvrYHKN+pmZGe5uRyRsLeinZXRmRqyt+/y2q5vT2wSB6R9yBuJTwPea6kLV
# LLGww08NF5jjsdj/9Rl2HgcAkMnAfWu/yOXlUTY=
# SIG # End signature block
