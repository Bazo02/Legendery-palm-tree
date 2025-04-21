# I denne oppgaven har jeg brukt metoden forklart i https://devblogs.microsoft.com/scripting/reverse-strings-with-powershell/.

# Leser hver linje fra filen
$linjer = Get-Content "./Oppgave 1/file.txt"

# Reverserer linjene 
foreach ($linje in $linjer) { # Itererer gjennom hver linje i filen.
    $tegn = $linje.ToCharArray() # Her blir hver streng delt opp til et array av tegn og lagret i variabelen $tegn.
    [Array]::Reverse($tegn)  # Denne metoden reverserer tegn ($tegn) arrayet
    $reversert = -join $tegn # Dette setter sammen de reverserte tegnene i en sammensatt string.
    Write-Output $reversert # Dette skriver ut reversert resultat i konsollen.
}
