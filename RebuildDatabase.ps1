Param(
   [string] $Server = "(localdb)\MSSQLLocalDb",
   [string] $Database = "560Project"
)

# This script requires the SQL Server module for PowerShell.
# The below commands may be required.

# To check whether the module is installed.
# Get-Module -ListAvailable -Name SqlServer;

# Install the SQL Server Module
# Install-Module -Name SqlServer -Scope CurrentUser

$CurrentDrive = (Get-Location).Drive.Name + ":"

Write-Host ""
Write-Host "Rebuilding database $Database on $Server..."

<#
   If on your local machine, you can drop and re-create the database.
#>
& ".\Scripts\DropDatabase.ps1" -Database $Database
& ".\Scripts\CreateDatabase.ps1" -Database $Database

<#
   If on the department's server, you don't have permissions to drop or create databases.
   In this case, maintain a script to drop all tables.
#>
#Write-Host "Dropping tables..."
#Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\DropTables.sql"

Write-Host "Creating schema..."
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Schemas\Basketball.sql"

Write-Host "Creating tables..."
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.Conference.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.Team.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.Season.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.Game.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.Player.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.TeamType.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.GameTeam.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Tables\Basketball.GamePlayer.sql"


Write-Host "Stored procedures..."
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.GetConferenceStandings.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.GetHistoricalPerformances.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.GetPlayerStats.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.GetPlayerStatsInRange.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.RetrieveAllGamePlayersForAPlayer.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.RetrieveAllGameTeamsForATeam.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.RetrieveConferences.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.RetrieveGames.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.RetrievePlayers.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.RetrieveTeams.sql"
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Procedures\Basketball.ShowPlayerRecordsLeaderboard.sql"

Write-Host "Inserting data..."
Invoke-SqlCmd -ServerInstance $Server -Database $Database -InputFile "BasketballData\Sql\Data\Basketball.TestData.sql"

Write-Host "Rebuild completed."
Write-Host ""

Set-Location $CurrentDrive
