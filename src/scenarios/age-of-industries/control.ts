// Set globals for control program
import {AOILogger} from "lib/objects/AOILogger";

declare namespace global {
};

script.on_init(() => {
    print("[Age of Industries] Age of Industries Scenario Started!")
});

script.on_event(
    defines.events.on_player_created,
    (event) => {
        let player = game.players[event.player_index];

        // Set player to soft god mode
        if (player.character) {
            player.character.destroy();
            player.character = undefined;
        }

        // Disable player's flashlight and enable cheat mode
        player.disable_flashlight();
        player.cheat_mode = true;
    }
);


script.on_event(
    defines.events.on_gui_opened,
    (event) => {
        let player = game.get_player(event.player_index)
        // player!.opened = undefined
    }
)