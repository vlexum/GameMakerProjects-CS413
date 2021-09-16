// Room Creation Code for the main hangman screen

// loops until user input is a populated string less than 7 chars
global.wordLength = 0;

while (global.wordLength <= 0 || global.wordLength > 6)
   {
	global.userString = string_lower(get_string("Enter word to be guessed:\nMust be under 6 letters", ""));

    global.wordLength = string_length(global.userString);
	
	if (global.wordLength > 6 )
		{
		 show_message("Please enter a word less than 7 characters");	
		}
   }
 
// Put string into array
var index;

global.wordArray = array_create(global.wordLength);

for ( index = 0; index < global.wordLength; index += 1 )
   {
	global.wordArray[index] = string_char_at( global.userString, index + 1 );
   }

// Room sprite population

var padding = 4;
var letterWidth = 6;
var yPlacement = 55;


var lyr_instances = layer_get_id("Instances");

var letters = array_create(global.wordLength );
global.dashInstances = array_create(global.wordLength);

for ( index = 0; index < global.wordLength; index += 1 )
   {
	var inst_letter = instance_create_layer( ( padding + index * ( padding + letterWidth ) ),
	                                            yPlacement, lyr_instances, obj_dash );
												
    inst_letter.wordChar = global.wordArray[index];
	global.dashInstances[index] = inst_letter;
	
    letters[global.wordLength + index] = inst_letter;
   }
 
 
 ////////////////////////////////////////////////////////////////////////////////////////////////
// Guess Handling
global.numLives = 6;
global.numRight = 0; 
global.counter = 0;

// while player has not lost
while global.numLives > 0 and global.counter < global.wordLength{
	//prompt for a guess
	global.userGuess = string_lower(get_string("Guess a letter:", ""));

	//if the guess is in the word
	if !is_undefined(wordArray[global.userGuess])
		{
			//capture the guess
			capturedChar = wordArray[global.userGuess];
			
			//replace dash with the guess (i think this is broken)
			wordArray[global.wordLength + index] = capturedChar;
			
			//iterate loop
			global.counter++;
		}
		
	else
		{
			//make a part of the body visible
			if instance_exists(obj_man_head) visible = true;
			
			//deduct a life
			global.numLives--;
			
			//iterate loop
			global.counter++;
		}
} 

//if user has lost
if ( global.numLives == 0 )
   {
    room_goto(rm_lose);
   }
   
 //if user has won
if ( global.numRight == global.wordLength )
   {
    room_goto(rm_win);
   }
   


   
