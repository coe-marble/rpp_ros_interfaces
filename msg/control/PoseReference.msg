
# The token selects the owned reference interface.
# Mask order: x, y, z, roll, pitch, yaw. Spatial rotations update together.
std_msgs/Header header
string identity_token
bool[6] mask
geometry_msgs/Pose reference
