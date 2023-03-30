execute_process(COMMAND python -V
    WORKING_DIRECTORY .
)
# 静默执行，不打印结果
execute_process(COMMAND python -V
    WORKING_DIRECTORY .
    OUTPUT_QUIET
)


execute_process(COMMAND python -V
    WORKING_DIRECTORY .
    OUTPUT_VARIABLE x
)
message("python -V 执行结果${x}")

