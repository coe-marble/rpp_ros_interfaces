# Coordinate and quantity IDs match the RPP field descriptor schema.
uint8 COORDINATE_INVALID=0
uint8 COORDINATE_EUCLIDEAN=1
uint8 COORDINATE_CONTINUOUS_ANGLE=2
uint8 COORDINATE_QUATERNION=3

uint8 QUANTITY_INVALID=0
uint8 QUANTITY_LINEAR_POSITION=1
uint8 QUANTITY_LINEAR_VELOCITY=2
uint8 QUANTITY_LINEAR_ACCELERATION=3
uint8 QUANTITY_ANGULAR_POSITION=4
uint8 QUANTITY_ANGULAR_VELOCITY=5
uint8 QUANTITY_ANGULAR_ACCELERATION=6
uint8 QUANTITY_FORCE=7
uint8 QUANTITY_MOMENT=8
uint8 QUANTITY_NORMALIZED=9
uint8 QUANTITY_VOLTAGE=10
uint8 QUANTITY_CURRENT=11
uint8 QUANTITY_PRESSURE=12
uint8 QUANTITY_ORIENTATION=13
uint8 QUANTITY_TEMPERATURE=14

string name
uint8 coordinate_kind
uint8 quantity

# Zero-based start and number of stored values. Quaternions use four values in xyzw order.
uint32 offset
uint32 width

string frame_id
string child_frame_id
string resource
