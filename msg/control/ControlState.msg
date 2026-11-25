# The whole controller vector with <name,info> pair
# The name and info vectors must be the same length
# The controller name must be unique
std_msgs/Header header
float64 dt
float64[6] eta
float64[6] eta_ref
float64[6] eta_error
float64[6] eta_error_body
bool[6] eta_is_integrating
float64[6] nu
float64[6] nu_ref
float64[6] nu_error
bool[6] nu_is_integrating
float64[6] tau
float64[6] tau_ref
std_msgs/Float32MultiArray cmd_out