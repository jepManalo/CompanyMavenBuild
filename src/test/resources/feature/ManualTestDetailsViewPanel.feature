@Manual
Feature: Details View Panel
  This feature is to verify Details View of both Activity and Connections Panel of Pizza Demo in EMS

  Scenario Outline: Activities Details View - Verify hovering on TestCases
		Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Activities Panel
    	And the user clicks an Activity
    	And the user hovers over the Activity in "<testCase>"
    Then the Connection arrow is "<resut>" in the Process Flow if Connection arrow is "<state>"
    	
    	Examples:
    		| testCase 				| result			| state							|
    		| Cases come from	| highlighted	|	already existing	|
    		| Cases come from	| previewed		|	not existing			|
    		| Cases go to			| highlighted	|	already existing	|
    		| Cases go to			| previewed		|	not existing			|
    		
  Scenario: Activities Details View - Verify Select Cases Dropdown
		Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Activities Panel
    	And the user clicks an Activity
    	And clicks the Select Cases dropdown
    Then "without this activity" selection is disabled
    	And "Cases starting here" selection is enalbled
    	And "Cases ending here" selection is enabled
    	
  Scenario Outline: Activities Details View - Verify Process Flow after Select Cases selection
		Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Activities Panel
    	And the user clicks an Activity
    	And clicks the Select Cases dropdown
    	And selects "<cases>" selection
    Then the Process Flow changes and "<result>"
    	And the Details View Panel is closed and reverts back to List View
    	And Header displays "<cases>" plus the Activity 
    
    Examples:
    	| cases 								| result																																					|
    	| with this activity		|	show all related Process Flow with the selected Activity is displayed						|
    	| without this activity	| show all related Process Flow without the selected Activity is displayed				|
    	| Cases starting here		| show all related Process Flow starting from the selected Activity is displayed	|
    	| Cases ending here			| show all related Process Flow ending from the selected Activity is displayed		|

  Scenario Outline: Connection Details View - Verify Process Flow after Select Cases selection
		Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under Connections Panel
    	And the user clicks a checked / unchecked Connection
    	And clicks the Select Cases dropdown
    	And selects "<cases>" selection
    Then the Process Flow changes and "<result>"
    	And the Details View Panel is closed and reverts back to List View
    	And Header displays "<header>" plus the Connection 
    
    Examples:
    	| cases 												| result																																			| header										|
    	| cases with this connection		|	show all related Process Flow with the selected Connection is displayed			|	Directly followed by			|
    	| cases without this connection	| show all related Process Flow without the selected Connection is displayed	| Not directly followed by	|