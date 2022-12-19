#include <sourcemod>
#include <morecolors>

#pragma semicolon 1

#define PLUGIN_VERSION "1.0"
#define MAX_FILE_LEN 80

// sugar coating
enum struct CCSPlayer {
    int teammatesKilled;
}

CCSPlayer player[MAXPLAYERS+1];

// Plugin definitions
public Plugin:myinfo = {
    name = "Teamkill Announce",
    author = "dnextreme88",
    description = "Displays a message letting everyone know who killed a teammate. Created on December 18, 2022.",
    version = PLUGIN_VERSION,
    url = "http://forums.alliedmods.net"
};

public void OnPluginStart() {
    HookEvent("player_death", Event_PlayerDeath);
}

public void OnClientPutInServer(int attacker) {
    // Initialize
    player[attacker].teammatesKilled = 0;
}

public Event_PlayerDeath(Handle:event, const String:name[], bool:dontBroadcast) {
    new victim = GetClientOfUserId(GetEventInt(event, "userid"));
    new attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
    int teammatesKilledLimit = 3; // 3 is the default

    if (attacker > 0 && victim > 0 && IsClientInGame(attacker) && IsClientInGame(victim)) {
        if (GetClientTeam(attacker) == GetClientTeam(victim) && victim != attacker) {
            new String:attackerName[64];
            new String:victimName[64];
            player[attacker].teammatesKilled++;

            GetClientName(attacker, attackerName, 33);
            GetClientName(victim, victimName, 33);

            if (player[attacker].teammatesKilled < teammatesKilledLimit) {
                CPrintToChatAllEx(attacker, "{teamcolor}%s{default} killed {teamcolor}%s{default} ({teamcolor}%i{default} of {green}%i{default} before kicking...)", attackerName, victimName, player[attacker].teammatesKilled, teammatesKilledLimit);
            } else {
                CPrintToChatAllEx(attacker, "{teamcolor}%s{default} killed {teamcolor}%s{default} ({teamcolor}%i{default} of {green}%i{default} - kicked)", attackerName, victimName, player[attacker].teammatesKilled, teammatesKilledLimit);
            }
        }
    }
}
