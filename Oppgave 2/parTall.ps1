

# Leser innholdet fra array.json
$jsonPath = "./Oppgave 2/array.json"
$nummer = Get-Content $jsonPath | ConvertFrom-Json # Her leses innholdet i JSON-filen som tekst, og det konverteres til et PowerShell-objekt (et array av tall), som lagres i variabelen $nummer.

#For å filtrere bort har jeg brukt metoden forklart her http://xahlee.info/powershell/powershell_filter_array.html 

# Filtrerer ut oddetall 
$parTall = $nummer | Where-Object { $_ % 2 -eq 0 }  # Her blir

# Skriver ut listen med partall
Write-Output $parTall