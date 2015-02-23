-- case management --

ALTER TABLE ACT_RU_CASE_EXECUTION
  ADD SUPER_EXEC_ nvarchar(64);

ALTER TABLE ACT_RU_CASE_EXECUTION
  ADD REQUIRED_ tinyint;

-- history --

ALTER TABLE ACT_HI_ACTINST
  ADD CALL_CASE_INST_ID_ nvarchar(64);

ALTER TABLE ACT_HI_PROCINST
  ADD SUPER_CASE_INSTANCE_ID_ nvarchar(64);

ALTER TABLE ACT_HI_CASEINST
  ADD SUPER_PROCESS_INSTANCE_ID_ nvarchar(64);

ALTER TABLE ACT_HI_CASEACTINST
  ADD REQUIRED_ tinyint;

create table ACT_HI_JOB_LOG (
    ID_ nvarchar(64) not null,
    TIMESTAMP_ datetime2 not null,
    JOB_ID_ nvarchar(64) not null,
    JOB_DUEDATE_ datetime2,
    JOB_RETRIES_ integer,
    JOB_EXCEPTION_MSG_ nvarchar(4000),
    JOB_EXCEPTION_STACK_ID_ nvarchar(64),
    JOB_STATE_ integer,
    JOB_DEF_ID_ nvarchar(64),
    JOB_DEF_TYPE_ nvarchar(255),
    JOB_DEF_CONFIGURATION_ nvarchar(255),
    ACT_ID_ nvarchar(64),
    EXECUTION_ID_ nvarchar(64),
    PROCESS_INSTANCE_ID_ nvarchar(64),
    PROCESS_DEF_ID_ nvarchar(64),
    PROCESS_DEF_KEY_ nvarchar(64),
    DEPLOYMENT_ID_ nvarchar(64),
    primary key (ID_)
);

create index ACT_IDX_HI_JOB_LOG_PROCINST on ACT_HI_JOB_LOG(PROCESS_INSTANCE_ID_);
create index ACT_IDX_HI_JOB_LOG_PROCDEF on ACT_HI_JOB_LOG(PROCESS_DEF_ID_);
