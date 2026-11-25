# ROS submission time. Deadlines use the same ROS clock, expressed as unsigned nanoseconds.
builtin_interfaces/Time stamp
# Reference-generator instance name advertised in ControlLayout.goals.
string interface_name
# Token returned by RequestExternalReference for this interface.
string identity_token

# One point in that generator's compact goal layout.
float64[] values

# Empty updates every value. False preserves the old value and its deadline.
# A quaternion's four entries must be updated together.
bool[] update_mask
uint64 deadline_ns
