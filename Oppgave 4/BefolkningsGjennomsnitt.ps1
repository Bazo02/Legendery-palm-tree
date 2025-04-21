#Jeg har brukt metoden forklart her til å hente data fra API og regne ut:
#https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-restmethod?view=powershell-7.5 
# og https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/measure-object?view=powershell-7.5
# og https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/read-host?view=powershell-7.5


# Henter data fra REST Countries API
# Bruker Invoke-RestMethod til å hente JSON-data fra https://restcountries.com/v3.1/all
$response = Invoke-RestMethod -Uri "https://restcountries.com/v3.1/all"

do {
    # Spør brukeren om land
    # Read-Host lar brukeren skrive inn navnet på et land via terminalen
    $landInput = Read-Host "Skriv inn et land (på engelsk, f.eks. Norway)" 

    # Prøver å finne landet
    # Det blir søkt gjennom alle land i API-responsen for å finne det som matcher brukerens input nøyaktig
    # $_.name.common er navnet på landet for eksempel "Norway"
    $landData = $response | Where-Object { $_.name.common -eq $landInput }

     #Hvis det ikke blir funnet noe, vises en feilmelding som ber brukeren prøve igjen i rød tekst
    if (-not $landData) {
        Write-Host "`nFant ikke landet '$landInput'. Prøv igjen." -ForegroundColor Red
    }

} until ($landData)  # Løkken fortsetter helt til det blir funnet et gyldig land som blir lagret i variabelen $landData

# Viser resultatet
# Når landet blir funnet blir det hentet ut common navnet og befolkningen
$navn = $landData.name.common
$befolkning = $landData.population

# Skriver ut navnet og befolkningstall i blå tekst
Write-Host "`n$navn har omtrent $befolkning innbyggere." -ForegroundColor Blue

# Regner ut hvor stor andel landet utgjør av verdens befolkning
# Først hentes den totale befolkningen i verden ved å summere befolkningen for alle land i API-responsen
# Så regner vi ut andelen ved å ta (landets befolkning / total befolkning) * 100
#  [math]::Round() blir brukt for å runde av til 2 desimaler
$totalBefolkning = ($response | Measure-Object -Property population -Sum).Sum
$andel = [math]::Round(($befolkning / $totalBefolkning) * 100, 2)

# Skriver ut hvor stor andel av verdens befolkning landet har, i grønn tekst
Write-Host "$navn utgjør omtrent $andel% av verdens befolkning." -ForegroundColor Green

