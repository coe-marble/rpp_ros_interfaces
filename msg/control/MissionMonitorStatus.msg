# One currently active monitor. Results are cached, not reevaluated for publishing.
string name
string instance_id

# False until this instance has returned an isOk result for the prepared mission.
bool evaluated
bool ok
uint8 rpp_status_code
# Explanation returned by isOk; empty when the monitor has nothing to report.
string message

# Selection and results refer to the most recently prepared/evaluated mission.
bool selected_for_goal
bool goal_evaluated
bool goal_reached
uint8 goal_status_code
