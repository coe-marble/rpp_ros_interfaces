# End time of this prediction; the estimator must currently be at stamp - dt_ns.
builtin_interfaces/Time stamp
uint64 layout_revision
uint64 dt_ns
uint64 input_dt_ns
float64[] inputs
# Already-discretized additive covariance, in state tangent order.
float64[] process_covariance
