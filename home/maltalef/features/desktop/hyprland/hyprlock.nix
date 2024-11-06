{ pkgs, inputs, ...}: {
	programs.hyprlock = {
		enable = true;
		package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;

		settings = {
			background = {
				monitor = "";
				color = "rgba(25, 20, 20, 1.0)";
			};

			input-field = {
				monitor = "";
				size = "200, 50";
				outline_thickness = 3;
				dots_size = 0.33;
				dots_spacing = 0.15;
				dots_center = false;
				dots_rounding = -1;
				#dots_fade_time = 200;
				#dots_text_format = "";
				outer_color = "rgb(151515)";
				inner_color = "rgb(200, 200, 200)";
				font_color = "rgb(10, 10, 10)";
				#font_family = "Noto Sans";
				fade_on_empty = true;
				fade_timeout = 1000;
				placeholder_text = "<i>Password...</i>";
				hide_input = false;
				rounding = -1;
				check_color = "rgb(204, 136, 34)";
				fail_color = "rgb(204, 34, 34)";
				fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
				#fail_timeout = 2000;
				fail_transition = 300;
				capslock_color = -1;
				numlock_color = -1;
				bothlock_color = -1;
				invert_numlock = false;
				swap_font_color = false;

				position = "0, -20";
				halign = "center";
				valign = "center";
			};

			label = {
				monitor = "";
				text = "cmd[update:1000] date '+%H:%M'";
				text_align = "center";
				color = "rgba(200, 200, 200, 1.0)";
				font_size = 25;
				font_family = "Noto Sans";
				rotate = 0;

				position = "0, 80";
				halign = "center";
				valign = "center";
			};
		};
	};
}
