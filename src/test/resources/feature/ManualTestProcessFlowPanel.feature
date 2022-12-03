@Manual
Feature: Process Flow Components
  This feature is to verify Process Flow Panel of Pizza Demo in EMS

  Scenario: Verify Case Frequency KPI
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user selects Case Frequency on the KPIs
    Then the statistics are updated in the Process Flow
    	And the Process Flow arrows are updated
    	And the Process Flow Description stays the same
    	And the KPI selection icon is not updated

  Scenario: Verify Activity Frequency KPI
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user selects Activity Frequency on the KPIs
    Then the statistics are updated in the Process Flow
    	And the Process Flow arrows are updated
    	And the Process Flow Description stays the same
    	And the KPI selection icon is not updated

  Scenario: Verify Throughput - Median Frequency KPI
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user selects Throughput - Median Frequency on the KPIs
    Then the statistics are updated in the Process Flow
    	And the Process Flow arrows are updated
    	And the Process Flow arrow description are updated based on the selected Time
    	And the Process Flow Description stays the same
    	And the KPI selection icon is updated to Timer
    	And days hrs mins are displayed during mouse hover on the KPI selection icon
    	
  Scenario: Verify Throughput - Avg Frequency KPI
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user selects Throughput - Avg Frequency on the KPIs
    Then the statistics are updated in the Process Flow
    	And the Process Flow arrows are updated
    	And the Process Flow arrow description are updated based on the selected Time
    	And the Process Flow Description stays the same
    	And the KPI selection icon is updated to Timer
    	And days hrs mins are displayed during mouse hover on the KPI selection icon
    	
  Scenario: Verify Throughput - Trimmed Mean Frequency KPI
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user selects Throughput - Trimmed Mean Frequency on the KPIs
    Then the statistics are updated in the Process Flow
    	And the Process Flow arrows are updated
    	And the Process Flow arrow description are updated based on the selected Time
    	And the Process Flow Description stays the same
    	And the KPI selection icon is updated to Timer
    	And days hrs mins are displayed during mouse hover on the KPI selection icon
    	
  Scenario Outline: Verify selecting time duration on Throughut KPI
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the user selects "<kpi>" Frequency on the KPIs
    Then the Process Flow arrows are updated
    	And the Process Flow arrow description are updated based on the "<time>"
    	
    	Examples:
    		| kpi 					| time 	|
    		| Mean 					| days 	|
    		| Mean 					| hrs 	|
    		| Mean 					| mins 	|
    		| Avg 					| days 	|
    		| Avg 					| hrs 	|
    		| Avg 					| mins 	|
    		| Trimmed Mean 	| days 	|
    		| Trimmed Mean 	| hrs 	|
    		| Trimmed Mean 	| mins 	|
    		
	Scenario: Verify Hide Activity
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the clicks the Hide Activity button
    	And deselects an activity to hide
    Then the selected activity is removed from the Process Flow
    	And the Process Flow arrows are updated
    	And the Process Flow arrow description are updated
    	
 	Scenario Outline: Verify Zoom btn
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the clicks the "<activity>" button
    Then the Process Flow "<activity>"
    
    Examples:
    	| actvity		|
    	| Zoom In		| 
    	| Zoom Out 	|
    	| Reset			|
    		
  Scenario: Verify Hide Activity
    Given the user is logged in Celonis EMS
    	And the user navigates to Pizza Demo analysis
    When the clicks the Hide Activity button
    	And deselects an activity to hide
    Then the selected activity is removed from the Process Flow
    	And the Process Flow arrows are updated
    	And the Process Flow arrow description are updated