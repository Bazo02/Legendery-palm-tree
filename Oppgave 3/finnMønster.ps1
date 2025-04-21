$root = "./Oppgave 3" # Variablen $root blir definert slik at vi kan bruke den relative pathen senere i koden 

# Jeg har brukt metodene forklart i https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.5
# og https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-7.5
 


# Skriver ut alle filer i $root og undermapper ved hjelp av Get-ChildItem.
    # -Recurse gjør at søket går gjennom alle undermapper
    # -File sørger for at bare filer inkluderes (ikke mapper)
    # ForEach-Object skriver ut hele filstien ved hjelp av $_.FullName

Write-Host "Alle filer i Oppgave 3 og undermapper er følgende:`n" 
Get-ChildItem $root -Recurse -File | ForEach-Object { Write-Host $_.FullName } 


# Finner alle .txt-filer som inneholder ordet "Sommer"
    # -File sikrer at bare filer inkluderes
    # -Filter "*.txt" begrenser resultatene til .txt-filer
    # -Pattern angir søkemønsteret
    # -Quiet gjør at Select-String returnerer true/false
    #  Where-Object filtrerer ut filene der Select-String returnerer true

$sommerFiler = Get-ChildItem $root -Recurse -Filter "*.txt" -File | Where-Object { 
    Select-String $_.FullName -Pattern "Sommer" -Quiet  
}


# Skriver ut antall og navn på filer som inneholder "Sommer"

Write-Host "`nAntall filer som inneholder 'Sommer': $($sommerFiler.Count)`n"
Write-Host "Følgende .txt-filer inneholder 'Sommer' i innholdet:`n"
$sommerFiler.FullName
