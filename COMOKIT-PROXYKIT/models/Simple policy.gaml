/***
* Name: Simplepolicy
* Based on the template at 'templates/Simple Policy.template'
* Based on a template model, part of COMOKIT. Its goal is to create simple experiments on a specific policy. 
* Release 1.0, May 2020. see http://comokit.org for support and updates
* Author: Patrick Taillandier
* Tags: covid19,epidemiology
***/

model Simplepolicy 

import "All COMOKIT.gaml"

global {
	
	// Parameter file folder
	// by default parameter files are placed in Parameters/ folder of COMOKIT
	// if you decide to redefine the path to that folder identify the place COMOKIT can find your parameter files
	string parameter_folder_path <- "../../COMOKIT/Parameters/";
	
	//string dataset_path <- "../Datasets/Redonda/"; // Relative path to the folder containing the boundary.shp, buildings.shp, satellite.png, etc. datafiles. 
	string dataset_path <- "../Datasets/Mirones_Bajo/"; // Relative path to the folder containing the boundary.shp, buildings.shp, satellite.png, etc. datafiles. 

	action define_policy{  
		// ***************************************************************************
		// SEE Model/Entities/Authority.gaml for built-in functions to create policies
		// ***************************************************************************	
		ask Authority {
			// look at the Authority species to see how to define policies
			//policy <- create_lockdown_policy();
		}
	}

}

experiment Simplepolicy parent: "Abstract Experiment" virtual: true{
	
	output {
		
		// A basic layout where nothing but the displays and the experiment controls appear on screen
		layout #split consoles: false editors: false navigator: false tray: false tabs: false toolbars: false controls: true;
	
		// Graphical display showing the geographical representation of the model 
		display "Main" parent: default_display {}
	
	}
	
	// Setup a chart to follow the number of infectious cases 
	permanent {
		display "charts" toolbar: false background: #black refresh: every(24 #cycle) {
			chart "Infectious cases" background: #black axes: #black color: #white title_font: default legend_font: font("Helvetica", 12, #bold) title_visible: true {
				data simulation.name value: simulation.number_of_infectious color: simulation.color marker: false style: line thickness: 2;
			}
		}
	}
}

experiment "Simple Policy Mirones Bajo" parent: Simplepolicy {
	parameter dataset_path var: dataset_path <- "../Datasets/Mirones_Bajo/"; 
}

experiment "Simple Policy Mesa Redonda" parent: Simplepolicy {
	parameter dataset_path var: dataset_path <- "../Datasets/Mesa_Redonda/"; 
}