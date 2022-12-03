@Manual
Feature: Activities Panel
  This feature is to verify Activities Panel of Pizza Demo in EMS

  Scenario Outline: Verify Activities Slider
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user drag the Activities slider "<dragActivity>"
    Then there will be Process Flow Activity "<addRemove>" from the Process Flow
    	And the Graph values in the Activities Panel is "<activitiesGraph>"
    	And the Less button is "<lessButton>"
    	And the More button is "<moreButton>"
    	
    	Examples:
    		| dragActivity 	| addRemove | activitiesGraph | lessButton 	| moreButton	|
    		| upwards				| added			| increased				| enabled			| enabled			|
    		| downwards			| removed		| decreased				| enabled			| enabled			|
    		| startPosition	| removed		| decreased				| disabled		| enabled			|
    		| maxPosition		| added			| increased				| enabled			| disabled		|
    		
	Scenario Outline: Verify Activities Btn	
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the "<button>"
    Then there will be Process Flow Activity "<processFlow>" from the Process Flow
    	And the Graph values in the Activities Panel is "<activitiesGraph>"
    	And the Graph color "<colorGraph>"
    	And the Less button is "<lessButton>"
    	And the More button is "<moreButton>"
    	
    	Examples:
    		| button 	| processFlow | activitiesGraph | colorGraph	|lessButton 	| moreButton	|
    		| Reset		| reset				| resets					| stay blue		| disabled		|	enabled 		|
    		| Less		| removed			| decreased				| turns red		| enabled			|	enabled 		|
    		| More		| added				| increased				| turns green	| enabled			|	enabled 		|
    		
	Scenario: Verify List View Btn	
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Activities Panel
    Then all the Activities available for the current Process Flow is displayed under Activities Panel
    
	Scenario: Verify Going to Details View	
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Activities Panel
    	And the user clicks an Activity
    Then the user is redirected to the Activity Details View
    
	Scenario: Verify clicking Displayed Activity via List View
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Activities Panel
    	And the user clicks an Activity existing in the initial load
    Then other activity not selected from the List View Section is not highlighted
    	And the activity selected from List View Section is highlighted
    	And the connections going into the activity selected are highlighted
    	And the connections going out the activity selected are highlighted
    	And the Right Navigation Bar now changes to the Details View of the activity selected
    	And the Header Panel displays a message "Keep Selection?" with X on the left and Check on the right
    	
	Scenario: Verify clicking Undisplayed Activity via List View
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Activities Panel
    	And the user clicks an Activity NOT existing in the initial load
    Then the Activity selected is added to the Process Flow
    	And the Process Flow does not highlight any Activity and Connection
    	And the Right Navigation Bar now changes to the Details View of the activity selected
    	And the Header Panel displays a message "Keep Selection?" with X on the left and Check on the right