@Manual
Feature: Connections Panel
  This feature is to verify Connections Panel of Pizza Demo in EMS

  Scenario Outline: Verify Connections Slider
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user drag the Connections slider "<dragActivity>"
    Then there will be Process Flow Connectiom "<addRemove>" from the Process Flow
    	And the Graph values in the Conection Panel is "<connectionGraph>"
    	And the Less button is "<lessButton>"
    	And the More button is "<moreButton>"
    	And the Fixed Layout button is "<fixedLayout>"
    	And the Fixed Layout button look stays the same
    	
    	Examples:
    		| dragActivity 	| addRemove | connectionGraph | lessButton 	| moreButton	| fixedLayout |
    		| upwards				| added			| increased				| enabled			| enabled			| enabled			|
    		| downwards			| removed		| decreased				| enabled			| enabled			| enabled			|
    		| startPosition	| removed		| decreased				| disabled		| enabled			| enabled			|
    		| maxPosition		| added			| increased				| enabled			| disabled		| enabled			|
    		
	Scenario Outline: Verify Connections Btn	
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the "<button>"
    Then there will be Process Flow Connection "<processFlow>" from the Process Flow
    	And the Graph values in the Connections Panel is "<connectionGraph>" to the previous value
    	And the Graph color "<colorGraph>"
    	And the Less button is "<lessButton>"
    	And the More button is "<moreButton>"
    	And the Fixed Layout button look stays the same
    	
    	Examples:
    		| button 	| processFlow | connectionGraph | colorGraph	|lessButton	| moreButton	|
    		| More		| added				| added						| turns green	| enabled		|	enabled 		|
    		| Less		| removed			| subtracted			| turns red		| enabled		|	enabled 		|
    		| Reset		| reset				| resets					| stay blue		| disabled	|	enabled 		|
    		
	Scenario Outline: Verify Fixed Layout Btn
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the Fixed Layout Btn to make it "<state>" look
    Then the Fixed Layout Btn is in "<color>" background
    When the user clicks "<button>"
    Then the Fixed Layout Btn is still in "<state>" look and "<color>" background
    	And the position of the Connections in the Process Flow graph is in "<connection>"
    	
    	Examples:
    		| state			| button 	|	color | connection 		|
    		| disabled	| More		|	grey	|	left side			|
    		| disabled	| Less		| grey 	|	left side			|
    		| enabled		| More		|	white	| pretty state	|
    		| enabled		| Less		| white	| pretty state	|
    		
	Scenario Outline: Verify On Hover Less & More Btn
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user hovers the mouse over the "<button>" button
    Then the "<connection>" Connection is "<state>" in the Process Flow graph
    	And the Graph color "<colorGraph>"
    	And the Graph values displays the "<connection>" percentage
    	And the preview value is displayed on the graph
    	
    	Examples:
    		| button 	|	connection			| state 			| colorGraph	|
    		| More		|	next						|	previewed		|	turns green	|
    		| Less		| last displayed 	|	highlighted	| turns red		|
    		
	Scenario: Verify List View Btn
		Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under Connections Panel
    Then all the Connections available for the current Process Flow is displayed under Connections Panel
    	And checkboxes are displayed with checks for the currently displayed connections in the Process Flow
    	And checkboxes are displayed without checks for the undisplayed connections related to the Process Flow
    	And checkboxes that are checked are disabled
    	And checkboxes that are unchecked are enabled
			And List View Btn label changes to Close Label
			
	Scenario Outline: Verify Check boxes in List View
		Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under Connections Panel
    	And the user "<cases>" a "<state>" Connection checkbox
    Then the Connection in the Process Flow is "<result>"
		    
    Examples:
    	|	cases		| state			|	result															|
    	| hovers	| checked		| highlighted													|
    	| hovers	| unchecked	| previewed														|
    	| clicks	| unchecked	| updated and adds the connection			|
    	| clicks	| checked		| updated and removes the connection	|
    	
	Scenario: Verify Going to Details View using List View Btn	
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user click the List View Btn under the Connections Panel
    	And the user clicks a Connection
    Then the user is redirected to the Connections Details View
    	
	Scenario: Verify clicking Checked Connection via List View	
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis	
    When the user click the List View Btn under the Connections Panel
    	And the user clicks a checked Connection
    Then the Connection is highlighted
    	And the Activity where the Connections start is highlighted
    	And the Activity where the Connections ends is highlighted
    	And the Right Navigation Bar now changes to the Details View of the Connection selected
    	And the Header Panel displays a message "Keep Selection?" with X on the left and Check on the right
    	
	Scenario: Verify clicking Unchecked Connection via List View	
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis	
    When the user click the List View Btn under the Connections Panel
    	And the user clicks an unchecked Connection
    Then the Connection selected is added to the Process Flow	
    	And the Activity where the Connections start is highlighted
    	And the Activity where the Connections ends is highlighted
    	And the Right Navigation Bar now changes to the Details View of the Connection selected
    	And the Header Panel displays a message "Keep Selection?" with X on the left and Check on the right