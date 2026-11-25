uint8 DISABLED=0
uint8 WAITING_FOR_STATE=1
uint8 WAITING_FOR_GOAL=2
uint8 RUNNING=3
uint8 FAULT=4

uint8 STAGE_NONE=0
uint8 STAGE_SET_GOAL=1
uint8 STAGE_SAMPLE=2
uint8 STAGE_COMPUTE=3
uint8 STAGE_MAP=4

builtin_interfaces/Time stamp
uint8 state

# RPP status is meaningful when failed_stage identifies a script call.
uint8 failed_stage
uint8 rpp_status_code
