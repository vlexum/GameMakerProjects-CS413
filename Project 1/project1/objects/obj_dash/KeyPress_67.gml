/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var index;

for ( index = 0; index < global.wordLength; index += 1 )
   {
	var tempId = global.dashInstances[index]
	   
	if ( global.wordArray[index] == "c" )
	   {
		with ( tempId )
		   {
	        instance_change(obj_letterC, false);
		   }
	   }
   }