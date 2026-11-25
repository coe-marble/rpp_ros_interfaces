# RPP ROS interfaces

ROS messages, services and actions shared by RPP control and estimation adapters.
This package contains definitions only; native plugin contracts remain in
`rpp_interfaces`. Coordinate kinds, quantities, units and status codes follow
version 1 of that shared contract.

Definitions are grouped by responsibility:

| Folder | Contents |
| --- | --- |
| `msg/common` | Numeric fields, layouts, named interfaces, samples and goals |
| `msg/control` | Control layouts, status, mission monitors and navigation references |
| `msg/estimation` | Estimator layouts, inputs, predictions, measurements, estimates and status |
| `srv/control` | Control and reference selection/ownership services |
| `srv/estimation` | Explicit estimator reset with state, covariance and reference time |
| `action/control` | Wrench step experiments |

The source folders do not add ROS namespaces. Generated types follow standard
ROS naming, such as `rpp_ros_interfaces/msg/NumericSample` and
`rpp_ros_interfaces/srv/ResetEstimate`. CMake stages canonical `msg`, `srv` and
`action` paths during configuration; consumers use the exported package targets.

`NumericLayout` describes stored coordinate offsets and widths. Covariances
are row-major matrices in tangent order: a quaternion stores four xyzw values
and has three covariance coordinates. Field quantities fix SI units and frames
are explicit. Estimator ingress carries the advertised `layout_revision` so a
queued message cannot be interpreted using a replacement layout. Predictions
carry additive, already-discretized process covariance; `dt_ns` is the state
advance and `input_dt_ns` is the input slew interval.

`EstimatorEstimate` provides one coherent state/covariance/reference-time
snapshot. `NumericSample` can additionally publish its state grouped by resource
for direct consumption by the control adapter. `EstimatorLayout.state_interfaces`
declares those exact resource layouts; their names, meanings and published order
remain stable when an estimator's internal coordinate order changes.

Control definitions were copied from `marble_control_msgs`, with package-local
references updated to `rpp_ros_interfaces`. The ROS type names therefore change;
consumers must rebuild and use the new package. The existing message repository
is not modified by this migration.

From a ROS workspace:

```bash
colcon build --packages-select rpp_ros_interfaces
source install/setup.bash
```

Builds and tests have not been run during creation of this package.
