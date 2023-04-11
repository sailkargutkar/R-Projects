-- PostgreSQL database dump

-- Dumped from database version 14.3
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA clinical;




CREATE TYPE clinical.appointmenttype AS ENUM (
    'UNKNOWN',
    'GENERAL_PRACTICE'
);




CREATE TYPE clinical.artifactorigin AS ENUM (
    'ARTIFACT_ORIGIN_UNKNOWN',
    'ARTIFACT_ORIGIN_SYSTEM_GENERATED',
    'ARTIFACT_ORIGIN_USER_UPLOADED',
    'ARTIFACT_ORIGIN_USER_REFERENCED'
);




CREATE TYPE clinical.artifactstatus AS ENUM (
    'ARTIFACT_STATUS_UNKNOWN',
    'ARTIFACT_STATUS_ACTIVE',
    'ARTIFACT_STATUS_DEPRECATED',
    'ARTIFACT_STATUS_ARCHIVED_DUPLICATE',
    'ARTIFACT_STATUS_ARCHIVED_CREATED_BY_ERROR',
    'ARTIFACT_STATUS_ARCHIVED_NEWER_VERSION_AVAILABLE',
    'ARTIFACT_STATUS_ARCHIVED_OTHER'
);




CREATE TYPE clinical.attribute_key_attribute_key_type AS ENUM (
    'ATTRIBUTE_KEY_TYPE_STRING',
    'ATTRIBUTE_KEY_TYPE_INT',
    'ATTRIBUTE_KEY_TYPE_BOOL',
    'ATTRIBUTE_KEY_TYPE_FLOAT',
    'ATTRIBUTE_KEY_TYPE_UNSTRUCTURED_OBJECT',
    'ATTRIBUTE_KEY_TYPE_LIST_STRING',
    'ATTRIBUTE_KEY_TYPE_LIST_INT',
    'ATTRIBUTE_KEY_TYPE_LIST_BOOL',
    'ATTRIBUTE_KEY_TYPE_LIST_FLOAT',
    'ATTRIBUTE_KEY_TYPE_LIST_UNSTRUCTURED_OBJECT',
    'ATTRIBUTE_KEY_TYPE_DATE',
    'ATTRIBUTE_KEY_TYPE_DB_REFERENCE',
    'ATTRIBUTE_KEY_TYPE_LIST_DB_REFERENCE',
    'ATTRIBUTE_KEY_TYPE_DATE_TIME',
    'ATTRIBUTE_KEY_TYPE_PARTIAL_DATE',
    'ATTRIBUTE_KEY_TYPE_PARTIAL_DATE_TIME'
);




CREATE TYPE clinical.attributekeyconfigentitytype AS ENUM (
    'ATTRIBUTE_KEY_CONFIG_ENTITY_TYPE_UNKNOWN',
    'ATTRIBUTE_KEY_CONFIG_ENTITY_TYPE_WORK_ORDER',
    'ATTRIBUTE_KEY_CONFIG_ENTITY_TYPE_ARTIFACT_SNAPSHOT',
    'ATTRIBUTE_KEY_CONFIG_ENTITY_TYPE_ATTRIBUTE_GROUP'
);




CREATE TYPE clinical.callingclienttype AS ENUM (
    'CALLING_CLIENT_TYPE_UNKNOWN',
    'CALLING_CLIENT_TYPE_MIDDLE_API',
    'CALLING_CLIENT_TYPE_API',
    'CALLING_CLIENT_TYPE_UI'
);




CREATE TYPE clinical.cardinality AS ENUM (
    'FLAT_FILE',
    'SAMPLE_SHEET'
);




CREATE TYPE clinical.chartstatus AS ENUM (
    'CHART_STATUS_UNKNOWN',
    'CHART_STATUS_ACTIVE',
    'CHART_STATUS_ARCHIVED'
);




CREATE TYPE clinical.charttype AS ENUM (
    'CHART_TYPE_UNKNOWN',
    'CHART_TYPE_BAR_CHART',
    'CHART_TYPE_PIE_CHART',
    'CHART_TYPE_LINE_CHART',
    'CHART_TYPE_SCATTER_PLOT',
    'CHART_TYPE_TABLE',
    'CHART_TYPE_BOX_WHISKER',
    'CHART_TYPE_HEATMAP',
    'CHART_TYPE_BAR_CHART_HORIZONTAL'
);




CREATE TYPE clinical.consentevent AS ENUM (
    'UNKNOWN',
    'REQUIRES_RECONSENT',
    'READY_TO_CONSENT',
    'CONSENT_GENERATED',
    'CONSENT_SENT',
    'CONSENT_SIGNED',
    'CONSENT_DECLINED',
    'CONSENT_WITHDRAWN',
    'IDENTITY_VERIFIED',
    'NOT_READY_TO_CONSENT'
);




CREATE TYPE clinical.consentlanguage AS ENUM (
    'UNKNOWN',
    'ENGLISH',
    'SPANISH',
    'VIETNAMESE',
    'ARABIC'
);




CREATE TYPE clinical.consentstatus AS ENUM (
    'UNKNOWN',
    'REQUIRES_RECONSENT',
    'READY_TO_CONSENT',
    'CONSENT_GENERATED',
    'CONSENT_PARTIALLY_SIGNED',
    'CONSENT_FULLY_SIGNED',
    'CONSENT_DECLINED',
    'CONSENT_WITHDRAWN',
    'NOT_READY_TO_CONSENT'
);




CREATE TYPE clinical.dashboardchartassociationstatus AS ENUM (
    'DASHBOARD_CHART_ASSOCIATION_STATUS_UNKNOWN',
    'DASHBOARD_CHART_ASSOCIATION_STATUS_ACTIVE',
    'DASHBOARD_CHART_ASSOCIATION_STATUS_ARCHIVED'
);




CREATE TYPE clinical.dashboardstatus AS ENUM (
    'DASHBOARD_STATUS_UNKNOWN',
    'DASHBOARD_STATUS_ACTIVE',
    'DASHBOARD_STATUS_ARCHIVED'
);




CREATE TYPE clinical.datamigrationrunstatus AS ENUM (
    'UNKNOWN',
    'SUCCESS',
    'SKIPPED'
);




CREATE TYPE clinical.eligibilitystatus AS ENUM (
    'UNKNOWN',
    'REQUIRES_REVIEW',
    'ELIGIBLE',
    'NOT_ELIGIBLE'
);




CREATE TYPE clinical.etlrunstatus AS ENUM (
    'UNKNOWN',
    'PENDING',
    'RUNNING',
    'FINISHED',
    'FAILED',
    'CANCELED'
);




CREATE TYPE clinical.gender AS ENUM (
    'Unknown',
    'Female',
    'Male',
    'Other'
);




CREATE TYPE clinical.ingestionstatus AS ENUM (
    'INGESTION_STATUS_STARTED',
    'INGESTION_STATUS_IN_PROGRESS',
    'INGESTION_STATUS_FINISHED',
    'INGESTION_STATUS_FAILED',
    'INGESTION_STATUS_UNKNOWN',
    'INGESTION_STATUS_FOUND',
    'INGESTION_STATUS_NOT_FOUND',
    'INGESTION_STATUS_UPLOADED',
    'INGESTION_STATUS_UPLOADING'
);




CREATE TYPE clinical.ingestiontype AS ENUM (
    'INGESTION_TYPE_MANUAL',
    'INGESTION_TYPE_CUSTOMER_PUSH',
    'INGESTION_TYPE_STREAMING_PULL',
    'INGESTION_TYPE_PERIODIC_PULL',
    'INGESTION_TYPE_UNKNOWN'
);




CREATE TYPE clinical.inputdataformat AS ENUM (
    'CSV',
    'TSV',
    'DATAFRAME',
    'BAM',
    'FASTQ',
    'BED',
    'XLSX',
    'JSON',
    'PBTXT',
    'UNKNOWN',
    'IMAGE',
    'VIDEO',
    'AUDIO',
    'PDF',
    'ZIP',
    'GZIP',
    'TXT',
    'HTML',
    'XHTML',
    'XML'
);




CREATE TYPE clinical.issue_creator_type AS ENUM (
    'UNKNOWN',
    'SYSTEM',
    'USER'
);




CREATE TYPE clinical.issue_resolution_reason AS ENUM (
    'UNKNOWN',
    'ISSUE_RESOLVED',
    'UNABLE_TO_RESOLVE'
);




CREATE TYPE clinical.issue_severity AS ENUM (
    'UNKNOWN',
    'LOW',
    'MEDIUM',
    'HIGH'
);




CREATE TYPE clinical.issue_status AS ENUM (
    'UNKNOWN',
    'OPEN',
    'CLOSED'
);




CREATE TYPE clinical.issue_type AS ENUM (
    'UNKNOWN',
    'CONFORMANCE_VALUE_RELATIONAL',
    'CONFORMANCE_COMPUTATIONAL',
    'COMPLETENESS',
    'PLAUSIBILITY'
);




CREATE TYPE clinical.practitionerroletype AS ENUM (
    'UNKNOWN',
    'PRIMARY_CARE_PROVIDER'
);




CREATE TYPE clinical.qcrulemodule AS ENUM (
    'UNKNOWN',
    'CUSTOMER',
    'CORE'
);




CREATE TYPE clinical.querysnapshotorigin AS ENUM (
    'QUERY_SNAPSHOT_ORIGIN_UNKNOWN',
    'QUERY_SNAPSHOT_ORIGIN_SYSTEM_GENERATED',
    'QUERY_SNAPSHOT_ORIGIN_USER_GENERATED'
);




CREATE TYPE clinical.querytemplatestatus AS ENUM (
    'QUERY_TEMPLATE_STATUS_UNKNOWN',
    'QUERY_TEMPLATE_STATUS_ACTIVE',
    'QUERY_TEMPLATE_STATUS_ARCHIVED'
);




CREATE TYPE clinical.referenceorigin AS ENUM (
    'REFERENCE_ORIGIN_UNKNOWN',
    'REFERENCE_ORIGIN_MANUAL',
    'REFERENCE_ORIGIN_AUTOMATIC'
);




CREATE TYPE clinical.referencestatus AS ENUM (
    'REFERENCE_STATUS_UNKNOWN',
    'REFERENCE_STATUS_ACTIVE',
    'REFERENCE_STATUS_ARCHIVED'
);




CREATE TYPE clinical.reportorigin AS ENUM (
    'REPORT_ORIGIN_UNKNOWN',
    'REPORT_ORIGIN_SYSTEM_GENERATED',
    'REPORT_ORIGIN_USER_GENERATED'
);




CREATE TYPE clinical.reportstatus AS ENUM (
    'REPORT_STATUS_UNKNOWN',
    'REPORT_STATUS_ACTIVE',
    'REPORT_STATUS_ARCHIVED'
);




CREATE TYPE clinical.savedquerystatus AS ENUM (
    'SAVED_QUERY_STATUS_UNKNOWN',
    'SAVED_QUERY_STATUS_SUCCESS',
    'SAVED_QUERY_STATUS_FAIL'
);




CREATE TYPE clinical.signingrole AS ENUM (
    'UNKNOWN',
    'PATIENT',
    'PERSON_OBTAINING_CONSENT'
);




CREATE TYPE clinical.signingtype AS ENUM (
    'SIGNING_TYPE_UNKNOWN',
    'SIGNING_TYPE_ELECTRONIC',
    'SIGNING_TYPE_PAPER'
);




CREATE TYPE clinical.studyrelationshiptype AS ENUM (
    'UNKNOWN',
    'PARENT'
);




CREATE TYPE clinical.swimlane AS ENUM (
    'Unknown',
    'Encounter',
    'Treatment',
    'Lab',
    'Radiology',
    'Procedure',
    'ClinicalTrial'
);




CREATE TYPE clinical.uipanelname AS ENUM (
    'UI_PANEL_NAME_UNKNOWN',
    'UI_PANEL_NAME_SETUP',
    'UI_PANEL_NAME_DATA',
    'UI_PANEL_NAME_QC',
    'UI_PANEL_NAME_WORKLIST'
);




CREATE TYPE clinical.variabledatatype AS ENUM (
    'UNKNOWN',
    'STRING',
    'INT',
    'BOOL',
    'FLOAT',
    'DATE',
    'DATE_TIME',
    'LIST_STRING',
    'FHIR_HUMAN_NAME',
    'FHIR_QUANTITY',
    'FHIR_CODING',
    'FHIR_CODEABLE_CONCEPT',
    'FHIR_ADDRESS',
    'FHIR_OBSERVATION_VALUE'
);




CREATE TYPE clinical.variableetlstatus AS ENUM (
    'UNKNOWN',
    'NOT_FOUND',
    'FOUND_BUT_DATA_ABSENT',
    'FAILED',
    'SUCCESS'
);




CREATE TYPE clinical.variablerelationshiptype AS ENUM (
    'UNKNOWN',
    'PARENT',
    'DERIVED_FROM',
    'RELATED_TO'
);




CREATE TYPE clinical.variablesourcecontexttype AS ENUM (
    'UNKNOWN',
    'FHIR_RESOURCE',
    'PRIOR_CLINICAL_NOTE',
    'OTHER_VARIABLE'
);




CREATE TYPE clinical.variableuserstatus AS ENUM (
    'UNKNOWN',
    'USER_UPDATED',
    'USER_CREATED'
);




CREATE TYPE clinical.variablevalidationstatus AS ENUM (
    'UNKNOWN',
    'VALIDATION_ERRORS',
    'VALIDATION_WARNINGS',
    'VALIDATION_SUCCESS'
);




CREATE TYPE clinical.workorderarchivestate AS ENUM (
    'WORK_ORDER_STATE_ACTIVE',
    'WORK_ORDER_STATE_ARCHIVED'
);




CREATE TYPE clinical.workorderdeclinereason AS ENUM (
    'UNKNOWN',
    'CREATED_BY_ERROR',
    'MISSING_SOURCE_DOCUMENTS',
    'NEWER_VERSION_AVAILABLE',
    'OTHER'
);




CREATE TYPE clinical.workorderlinktype AS ENUM (
    'WORK_ORDER_LINK_TYPE_TO_BE_COMPLETED_WITH',
    'WORK_ORDER_LINK_TYPE_BLOCKS',
    'WORK_ORDER_LINK_TYPE_BLOCKED_BY',
    'WORK_ORDER_LINK_TYPE_CREATED_WITH'
);




CREATE TYPE clinical.workorderstatus AS ENUM (
    'WORK_ORDER_STATUS_NOT_STARTED',
    'WORK_ORDER_STATUS_IN_PROGRESS',
    'WORK_ORDER_STATUS_COMPLETED',
    'WORK_ORDER_STATUS_COULD_NOT_COMPLETE',
    'WORK_ORDER_STATUS_CANCELED',
    'WORK_ORDER_STATUS_DECLINED'
);




CREATE FUNCTION clinical.jsonb_minus(json jsonb, keys text[]) RETURNS jsonb
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  SELECT
    -- Only executes opration if the JSON document has the keys
    CASE WHEN "json" ?| "keys"
      THEN COALESCE(
          (SELECT ('{' || string_agg(to_json("key")::text || ':' || "value", ',') || '}')
           FROM jsonb_each("json")
           WHERE "key" <> ALL ("keys")),
          '{}'
        )::jsonb
      ELSE "json"
    END
$$;




CREATE FUNCTION clinical.jsonb_minus(arg1 jsonb, arg2 jsonb) RETURNS jsonb
    LANGUAGE sql
    AS $$

  SELECT
    COALESCE(
      json_object_agg(
        key,
        CASE
          -- if the value is an object and the value of the second argument is
          -- not null, we do a recursion
          WHEN jsonb_typeof(value) = 'object' AND arg2 -> key IS NOT NULL
          THEN jsonb_minus(value, arg2 -> key)
          -- for all the other types, we just return the value
          ELSE value
        END
      ),
    '{}'
    )::jsonb
  FROM
    jsonb_each(arg1)
  WHERE
    arg1 -> key <> arg2 -> key
    OR arg2 -> key IS NULL

$$;




CREATE FUNCTION clinical.notify_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
  rec RECORD;
  payload TEXT;
  column_name TEXT;
  column_value TEXT;
  payload_items JSONB;
BEGIN
  -- Set record row depending on operation
  CASE TG_OP
  WHEN 'INSERT', 'UPDATE' THEN
     rec := NEW;
  WHEN 'DELETE' THEN
     rec := OLD;
  ELSE
     RAISE EXCEPTION 'Unknown TG_OP: "%". Should not occur!', TG_OP;
  END CASE;
  
  -- Get required fields
  FOREACH column_name IN ARRAY TG_ARGV LOOP
    CASE column_name
    WHEN 'row_data', 'changed_fields' THEN
      EXECUTE format('SELECT $1.%I::jsonb', column_name)
      INTO column_value
      USING rec;
    ELSE 
      EXECUTE format('SELECT $1.%I::TEXT', column_name)
      INTO column_value
      USING rec;
    END CASE;
    payload_items := coalesce(payload_items,'{}')::jsonb || json_build_object(column_name,column_value)::jsonb;
  END LOOP;

  -- Build the payload
  payload := json_build_object(
    'timestamp',CURRENT_TIMESTAMP,
    'operation',TG_OP,
    'schema',TG_TABLE_SCHEMA,
    'table',TG_TABLE_NAME,
    'data',payload_items
  );

  -- Notify the channel
  -- TODO - read this channel from an env variable
  -- TODO (Bianca) Why is casting necessary?
  PERFORM pg_notify('db_notifications', payload)
  WHERE ((payload::json->>'data')::json->>'schema_name', (payload::json->>'data')::json->>'table_name') in (select schema_name, table_name from data_factory.search_tables);
  
  RETURN rec;
END;
$_$;




CREATE OPERATOR clinical.- (
    FUNCTION = clinical.jsonb_minus,
    LEFTARG = jsonb,
    RIGHTARG = text[]
);




CREATE OPERATOR clinical.- (
    FUNCTION = clinical.jsonb_minus,
    LEFTARG = jsonb,
    RIGHTARG = jsonb
);



SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE clinical.alembic_version (
    version_num character varying(32) NOT NULL
);




CREATE TABLE clinical.alembic_version_history (
    version_num character varying(32) NOT NULL,
    app_version character varying(32) NOT NULL,
    applied_at timestamp without time zone NOT NULL,
    is_upgrade boolean NOT NULL,
    message text NOT NULL
);




CREATE TABLE clinical.artifact_references (
    uuid uuid NOT NULL,
    text character varying,
    total_area jsonb,
    sub_areas jsonb,
    artifact_snapshot_uuid uuid,
    artifact_snapshot_transcript_uuid uuid,
    reference_status clinical.referencestatus NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    neighboring_text character varying,
    reference_model_name character varying,
    reference_model_version character varying,
    reference_origin clinical.referenceorigin NOT NULL,
    CONSTRAINT artifact_references_check CHECK (((
CASE
    WHEN (artifact_snapshot_uuid IS NOT NULL) THEN 1
    ELSE NULL::integer
END +
CASE
    WHEN (artifact_snapshot_transcript_uuid IS NOT NULL) THEN 1
    ELSE NULL::integer
END) = 1))
);




CREATE TABLE clinical.artifact_snapshot_attributes (
    min_value double precision,
    max_value double precision,
    min_string_length integer,
    max_string_length integer,
    numeric_options double precision[],
    string_regex_pattern character varying,
    string_regex_message character varying,
    string_regex_example character varying,
    db_reference_entity_type character varying,
    db_reference_preconfigured_params json,
    db_reference_searchable_field character varying,
    db_reference_key_path character varying,
    db_reference_value_path character varying,
    unstructured_object_key_definitions json,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    bypassed_validation boolean DEFAULT false,
    json_value jsonb NOT NULL,
    is_null boolean NOT NULL,
    is_required boolean,
    is_hidden boolean,
    is_editable boolean DEFAULT true NOT NULL,
    is_worklist_editable boolean DEFAULT false NOT NULL,
    artifact_snapshot_uuid uuid NOT NULL,
    attribute_uuid uuid NOT NULL,
    attribute_key_configuration_uuid uuid NOT NULL,
    string_options character varying[],
    db_reference_ui_display_params json,
    uncommitted_json_input json,
    time_to_complete_sec integer
);




CREATE TABLE clinical.artifact_snapshot_previews (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    input_data_format clinical.inputdataformat NOT NULL,
    input_data_location character varying,
    ingestion_status clinical.ingestionstatus NOT NULL,
    ingestion_error_message character varying,
    ingestion_metadata jsonb,
    schema_id integer,
    started_time timestamp with time zone,
    finished_time timestamp with time zone,
    input_data_size_bytes bigint,
    input_data_hash character varying,
    input_data_last_modified timestamp with time zone,
    artifact_snapshot_uuid uuid NOT NULL
);




CREATE TABLE clinical.artifact_snapshot_transcripts (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    input_data_format clinical.inputdataformat NOT NULL,
    input_data_location character varying,
    ingestion_status clinical.ingestionstatus NOT NULL,
    ingestion_error_message character varying,
    ingestion_metadata jsonb,
    schema_id integer,
    started_time timestamp with time zone,
    finished_time timestamp with time zone,
    input_data_size_bytes bigint,
    input_data_hash character varying,
    input_data_last_modified timestamp with time zone,
    writer_name character varying,
    writer_version character varying,
    artifact_snapshot_uuid uuid NOT NULL,
    structured_data_hash character varying,
    structured_data_last_modified timestamp with time zone,
    structured_data_location character varying,
    structured_data_size_bytes bigint,
    text_data_hash character varying,
    text_data_last_modified timestamp with time zone,
    text_data_location character varying,
    text_data_size_bytes bigint
);




CREATE TABLE clinical.artifact_snapshots (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    input_data_format clinical.inputdataformat NOT NULL,
    input_data_location character varying,
    ingestion_status clinical.ingestionstatus NOT NULL,
    ingestion_error_message character varying,
    schema_id integer,
    started_time timestamp with time zone,
    finished_time timestamp with time zone,
    input_data_size_bytes bigint,
    input_data_hash character varying,
    input_data_last_modified timestamp with time zone,
    artifact_uuid uuid NOT NULL,
    parent_artifact_snapshot_uuid uuid,
    ingestion_metadata jsonb,
    binary_fhir_id character varying
);




CREATE TABLE clinical.artifact_type_configurations (
    uuid uuid NOT NULL,
    before_snapshot_create_trigger character varying,
    update_has_side_effects boolean,
    artifact_type_uuid uuid NOT NULL
);




CREATE TABLE clinical.artifact_types (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL,
    description character varying,
    file_type_uuid uuid,
    authored_date_display_name character varying,
    event_date_display_name character varying,
    snapshot_ingest_config jsonb,
    snapshot_ingest_handler character varying
);




CREATE TABLE clinical.artifacts (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL,
    barcode character varying NOT NULL,
    ingestion_type clinical.ingestiontype NOT NULL,
    created_time timestamp with time zone,
    last_ingested_time timestamp with time zone,
    cardinality clinical.cardinality,
    artifact_origin clinical.artifactorigin,
    default_input_data_location character varying,
    latest_input_data_location character varying,
    artifact_status clinical.artifactstatus NOT NULL,
    artifact_type_uuid uuid,
    patient_uuid uuid,
    event_date timestamp with time zone,
    fields_updated_by_user character varying[],
    authored_date timestamp with time zone
);




CREATE TABLE clinical.attribute_group_types (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying(63) NOT NULL,
    display_name character varying,
    description character varying,
    help_text character varying,
    deprecated boolean
);




CREATE TABLE clinical.attribute_key_configurations (
    min_value double precision,
    max_value double precision,
    min_string_length integer,
    max_string_length integer,
    numeric_options double precision[],
    string_regex_pattern character varying,
    string_regex_message character varying,
    string_regex_example character varying,
    db_reference_entity_type character varying,
    db_reference_preconfigured_params json,
    db_reference_searchable_field character varying,
    db_reference_key_path character varying,
    db_reference_value_path character varying,
    unstructured_object_key_definitions json,
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    is_required boolean,
    is_editable boolean,
    is_worklist_editable boolean,
    is_hidden boolean,
    ui_panel_name clinical.uipanelname,
    "position" integer,
    default_is_null boolean,
    default_json_value jsonb NOT NULL,
    before_update_trigger character varying,
    update_has_side_effects boolean,
    deprecated boolean,
    attribute_key_configuration_type character varying NOT NULL,
    entity_type clinical.attributekeyconfigentitytype NOT NULL,
    attribute_key_uuid uuid NOT NULL,
    string_options_uuid uuid,
    file_type_uuid uuid,
    artifact_type_uuid uuid,
    work_order_type_uuid uuid,
    attribute_group_type_uuid uuid,
    is_not_reported_allowed boolean,
    db_reference_ui_display_params json,
    has_artifact_references boolean
);




CREATE TABLE clinical.attribute_keys (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL,
    data_type clinical.attribute_key_attribute_key_type NOT NULL,
    display_name character varying,
    external_system_name character varying,
    float_dp_precision integer,
    description character varying,
    help_text character varying,
    placeholder_text character varying
);




CREATE TABLE clinical.attribute_sources (
    attribute_uuid uuid NOT NULL,
    artifact_reference_uuid uuid NOT NULL
);




CREATE TABLE clinical.biomarker_test_providers (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    laboratory_name character varying NOT NULL,
    institution_name character varying
);




CREATE TABLE clinical.biomarker_tests (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    biomarker_test_provider_uuid uuid NOT NULL,
    gtr_accession_version character varying NOT NULL,
    test_id integer,
    test_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);




CREATE TABLE clinical.biomarker_tests_human_genes_association (
    biomarker_test_uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    gene_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);




CREATE TABLE clinical.consent_decline_reasons (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    description character varying
);




CREATE TABLE clinical.consent_language_configs (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    consent_language clinical.consentlanguage NOT NULL,
    english_display_name character varying NOT NULL,
    native_display_name character varying NOT NULL,
    pin_field_text character varying NOT NULL,
    language_field_text character varying NOT NULL,
    checkbox_field_text character varying NOT NULL,
    printed_name_field_text character varying NOT NULL,
    signature_field_text character varying NOT NULL,
    date_field_text character varying NOT NULL,
    get_started_button_text character varying NOT NULL,
    back_button_text character varying NOT NULL,
    next_button_text character varying NOT NULL,
    submit_button_text character varying NOT NULL,
    decline_button_text character varying NOT NULL
);




CREATE TABLE clinical.data_migration_runs (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL,
    description character varying NOT NULL,
    sequence_num integer NOT NULL,
    python_file character varying NOT NULL,
    software_version character varying NOT NULL,
    alembic_version character varying NOT NULL,
    runtime_sec double precision,
    status clinical.datamigrationrunstatus NOT NULL,
    CONSTRAINT sequence_name_check CHECK ((sequence_num > 0))
);




CREATE TABLE clinical.etl_appointment (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    appointment_fhir_id character varying NOT NULL,
    practitioner_uuid uuid,
    practitioner_name character varying,
    start_date character varying NOT NULL,
    end_date character varying,
    status character varying NOT NULL,
    description character varying,
    etl_run_uuid uuid NOT NULL,
    patient_uuid uuid NOT NULL,
    appointment_type clinical.appointmenttype NOT NULL
);




CREATE TABLE clinical.etl_cancer_summary (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    cancer_type character varying,
    cancer_stage character varying,
    clinical_status jsonb,
    verification_status jsonb,
    onset_date date,
    patient_uuid uuid NOT NULL,
    etl_run_uuid uuid NOT NULL
);




CREATE TABLE clinical.etl_demographics (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    patient_uuid uuid NOT NULL,
    etl_run_uuid uuid NOT NULL,
    family_name character varying,
    given_name character varying,
    encrypted_data character varying,
    hmac_mrn character varying
);




CREATE TABLE clinical.etl_events (
    uuid uuid NOT NULL,
    etl_run_uuid uuid NOT NULL,
    name character varying NOT NULL,
    started_at timestamp with time zone NOT NULL,
    finished_at timestamp with time zone NOT NULL
);




CREATE TABLE clinical.etl_patient_practitioner (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    practitioner_fhir_id character varying NOT NULL,
    etl_run_uuid uuid NOT NULL,
    patient_uuid uuid NOT NULL,
    family_name character varying,
    given_name character varying,
    names jsonb,
    practitioner_role_type clinical.practitionerroletype NOT NULL
);




CREATE TABLE clinical.etl_runs (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    patient_uuid uuid,
    status clinical.etlrunstatus DEFAULT 'PENDING'::clinical.etlrunstatus NOT NULL,
    started_at timestamp with time zone,
    ended_at timestamp with time zone,
    etl_request jsonb NOT NULL,
    partition_key character varying NOT NULL,
    error_output text,
    created_by character varying NOT NULL,
    priority integer,
    etl_version character varying
);




CREATE TABLE clinical.etl_timeline_event (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    swimlane clinical.swimlane NOT NULL,
    type character varying,
    fhir_id character varying,
    start timestamp without time zone,
    "end" timestamp without time zone,
    status character varying,
    subtype character varying,
    codes jsonb,
    patient_uuid uuid NOT NULL,
    etl_run_uuid uuid NOT NULL
);




CREATE TABLE clinical.fhir_server (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    url character varying,
    description character varying
);




CREATE TABLE clinical.file_types (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL
);




CREATE TABLE clinical.human_genes (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    description character varying,
    ncbi_entrez_gene_id integer NOT NULL
);




CREATE TABLE clinical.issue_variable_instance_versioned_association (
    variable_instance_uuid uuid NOT NULL,
    variable_version_num integer NOT NULL,
    issue_uuid uuid NOT NULL
);




CREATE TABLE clinical.issues (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    message character varying NOT NULL,
    type clinical.issue_type NOT NULL,
    severity clinical.issue_severity,
    creator_type clinical.issue_creator_type NOT NULL,
    creator_user_sub character varying(100),
    status clinical.issue_status NOT NULL,
    resolution_reason clinical.issue_resolution_reason,
    resolution_metadata jsonb
);




CREATE TABLE clinical.qc_rule_eval_result_variable_instance_versioned_association (
    qc_rule_eval_result_uuid uuid NOT NULL,
    variable_instance_uuid uuid NOT NULL,
    variable_version_num integer NOT NULL
);




CREATE TABLE clinical.qc_rule_eval_results (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    qc_rule_uuid uuid NOT NULL,
    passed boolean NOT NULL
);




CREATE TABLE clinical.variable_instances_versioned (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_config_uuid uuid NOT NULL,
    patient_uuid uuid NOT NULL,
    event_date timestamp with time zone,
    etl_value jsonb,
    etl_metadata jsonb,
    etl_status clinical.variableetlstatus,
    user_value jsonb,
    user_metadata jsonb,
    user_status clinical.variableuserstatus,
    etl_run_uuid uuid,
    user_confirmed boolean,
    version_num integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    encrypted_etl_value character varying,
    encrypted_user_value character varying,
    created_by character varying NOT NULL,
    updated_by character varying,
    CONSTRAINT variable_instances_check CHECK (((version_num >= 1) AND (start_date < end_date)))
);




CREATE MATERIALIZED VIEW clinical.latest_qc_rule_eval_results AS
 SELECT anon_1.qc_rule_uuid,
    anon_1.variable_instance_uuid,
    anon_1.variable_instance_version_num,
    anon_1.patient_uuid,
    anon_1.latest_qc_rule_eval_result_uuid,
    anon_1.latest_qc_rule_eval_result_created_at,
    anon_1.latest_qc_rule_eval_result_passed,
    now() AS last_refreshed
   FROM ( SELECT qc_rule_eval_results.qc_rule_uuid,
            variable_instances_versioned.uuid AS variable_instance_uuid,
            variable_instances_versioned.version_num AS variable_instance_version_num,
            variable_instances_versioned.patient_uuid,
            qc_rule_eval_results.uuid AS latest_qc_rule_eval_result_uuid,
            qc_rule_eval_results.created_at AS latest_qc_rule_eval_result_created_at,
            qc_rule_eval_results.passed AS latest_qc_rule_eval_result_passed,
            row_number() OVER (PARTITION BY qc_rule_eval_results.qc_rule_uuid, variable_instances_versioned.uuid ORDER BY qc_rule_eval_results.created_at DESC) AS rn
           FROM ((clinical.variable_instances_versioned
             JOIN clinical.qc_rule_eval_result_variable_instance_versioned_association qc_rule_eval_result_variable_instance_versioned_associati_1 ON (((variable_instances_versioned.uuid = qc_rule_eval_result_variable_instance_versioned_associati_1.variable_instance_uuid) AND (variable_instances_versioned.version_num = qc_rule_eval_result_variable_instance_versioned_associati_1.variable_version_num))))
             JOIN clinical.qc_rule_eval_results ON ((qc_rule_eval_results.uuid = qc_rule_eval_result_variable_instance_versioned_associati_1.qc_rule_eval_result_uuid)))) anon_1
  WHERE (anon_1.rn = 1)
  WITH NO DATA;




CREATE TABLE clinical.medical_code_ontologies (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    version character varying NOT NULL,
    publication_date timestamp with time zone NOT NULL,
    ingestion_date timestamp with time zone NOT NULL,
    external_source_url character varying NOT NULL,
    internal_source_url character varying NOT NULL,
    system_url character varying NOT NULL,
    system_oid character varying
);




CREATE TABLE clinical.medical_codes (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    ontology_uuid uuid NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    description jsonb NOT NULL,
    synonyms character varying[]
);




CREATE TABLE clinical.omop_concepts (
    concept_id integer NOT NULL,
    ontology_uuid uuid NOT NULL,
    concept_name character varying,
    vocabulary_id character varying NOT NULL,
    concept_code character varying NOT NULL
);




CREATE SEQUENCE clinical.omop_concepts_concept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE clinical.omop_concepts_concept_id_seq OWNED BY clinical.omop_concepts.concept_id;



CREATE TABLE clinical.patient_active_consent_documents (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    patient_uuid uuid NOT NULL,
    study_consent_document_uuid uuid NOT NULL,
    document_expiry timestamp with time zone NOT NULL,
    pin character varying NOT NULL
);




CREATE TABLE clinical.patient_consent_events (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    patient_uuid uuid NOT NULL,
    study_consent_document_uuid uuid NOT NULL,
    event clinical.consentevent NOT NULL,
    event_time timestamp with time zone NOT NULL,
    event_metadata jsonb
);




CREATE TABLE clinical.patient_consent_status (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    patient_uuid uuid NOT NULL,
    study_uuid uuid NOT NULL,
    consent_status clinical.consentstatus NOT NULL,
    patient_consent_event_uuid uuid NOT NULL
);




CREATE SEQUENCE clinical.seq_patient_ids_sequence_num
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE clinical.patient_ids (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    fhir_server_uuid uuid NOT NULL,
    fhir_id character varying NOT NULL,
    external_id character varying,
    onboarded_time timestamp without time zone,
    sequence_num integer DEFAULT nextval('clinical.seq_patient_ids_sequence_num'::regclass) NOT NULL,
    active boolean NOT NULL,
    is_test boolean,
    last_ehr_update_time timestamp without time zone
);




CREATE TABLE clinical.qc_rule_variable_config_association (
    qc_rule_uuid uuid NOT NULL,
    variable_config_uuid uuid NOT NULL
);




CREATE TABLE clinical.qc_rules (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    display_name character varying NOT NULL,
    fhir_server_uuid uuid,
    description character varying,
    module clinical.qcrulemodule NOT NULL,
    python_function character varying NOT NULL,
    evaluation_order integer DEFAULT 0 NOT NULL
);




CREATE SEQUENCE clinical.seq_artifacts_a
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE SEQUENCE clinical.seq_sites_sequence_num
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE SEQUENCE clinical.seq_work_orders_wk
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE clinical.site_fhir_server_association (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    site_uuid uuid NOT NULL,
    fhir_server_uuid uuid NOT NULL
);




CREATE TABLE clinical.site_organization_site_association (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    site_organization_uuid uuid NOT NULL,
    site_uuid uuid NOT NULL
);




CREATE TABLE clinical.site_organizations (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    description character varying NOT NULL
);




CREATE TABLE clinical.site_study_association (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    site_uuid uuid NOT NULL,
    study_uuid uuid NOT NULL
);




CREATE TABLE clinical.site_study_details (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    site_uuid uuid NOT NULL,
    study_version_uuid uuid NOT NULL,
    principal_investigator character varying
);




CREATE TABLE clinical.sites (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    description character varying NOT NULL,
    address jsonb,
    sequence_num integer DEFAULT nextval('clinical.seq_sites_sequence_num'::regclass) NOT NULL,
    timezone_uuid uuid NOT NULL,
    is_test boolean DEFAULT false NOT NULL
);




CREATE TABLE clinical.string_options (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying(8) NOT NULL,
    string_options character varying[] NOT NULL,
    is_user_editable boolean
);




CREATE TABLE clinical.studies (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    description character varying NOT NULL,
    require_consent_time boolean NOT NULL
);




CREATE TABLE clinical.study_consent_document_fields (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    study_consent_document_uuid uuid NOT NULL,
    consent_language clinical.consentlanguage NOT NULL,
    signing_role clinical.signingrole NOT NULL,
    printed_name_field_x integer NOT NULL,
    printed_name_field_y integer NOT NULL,
    signature_field_x integer NOT NULL,
    signature_field_y integer NOT NULL,
    date_field_x integer NOT NULL,
    date_field_y integer NOT NULL
);




CREATE TABLE clinical.study_consent_documents (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    study_consent_version_uuid uuid NOT NULL,
    site_uuid uuid,
    consent_document_folder character varying NOT NULL,
    consent_languages clinical.consentlanguage[] NOT NULL,
    required_signing_roles clinical.signingrole[] NOT NULL
);




CREATE TABLE clinical.study_consent_versions (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    study_version_uuid uuid NOT NULL,
    requires_reconsent boolean NOT NULL,
    end_date timestamp without time zone NOT NULL,
    start_date timestamp without time zone NOT NULL,
    version_major integer NOT NULL,
    version_minor integer NOT NULL
);




CREATE TABLE clinical.study_relationships (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    study_uuid_from uuid NOT NULL,
    study_uuid_to uuid NOT NULL,
    relationship_type clinical.studyrelationshiptype NOT NULL
);




CREATE TABLE clinical.study_versions (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    study_uuid uuid NOT NULL,
    protocol_uri character varying,
    end_date timestamp without time zone NOT NULL,
    start_date timestamp without time zone NOT NULL,
    version_major integer NOT NULL,
    version_minor integer NOT NULL,
    eligibility_variable_config_uuid uuid
);




CREATE TABLE clinical.timezones (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL
);




CREATE TABLE clinical.variable_cdisc_mappings (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_key_uuid uuid NOT NULL,
    description character varying,
    sdtm_domain_name character varying,
    sdtm_variable_name character varying,
    python_function character varying
);




CREATE TABLE clinical.variable_config_extractions (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_config_uuid uuid NOT NULL,
    fhir_server_uuid uuid,
    description character varying,
    python_function character varying
);




CREATE TABLE clinical.variable_config_relationship_extractions (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_config_relationship_uuid uuid NOT NULL,
    variable_config_relationship_version_num integer NOT NULL,
    fhir_server_uuid uuid,
    description character varying,
    python_function character varying
);




CREATE TABLE clinical.variable_config_relationships (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_config_uuid_from uuid NOT NULL,
    variable_config_uuid_to uuid NOT NULL,
    relationship_type clinical.variablerelationshiptype NOT NULL,
    version_num integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    created_by character varying NOT NULL,
    updated_by character varying,
    relationship_label character varying,
    description character varying,
    CONSTRAINT check_variable_config_relationships CHECK (((version_num >= 1) AND (start_date < end_date)))
);




CREATE TABLE clinical.variable_config_source_contexts (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_config_uuid uuid NOT NULL,
    source_context_type clinical.variablesourcecontexttype NOT NULL,
    fhir_resource_type character varying,
    other_variable_key_uuid uuid
);




CREATE TABLE clinical.variable_configs (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_key_uuid uuid NOT NULL,
    version integer NOT NULL,
    is_phi boolean DEFAULT true NOT NULL,
    is_editable boolean DEFAULT true NOT NULL,
    is_not_reported_allowed boolean,
    value_constraints jsonb
);




CREATE TABLE clinical.variable_domains (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    display_name character varying NOT NULL
);




CREATE TABLE clinical.variable_edit_reasons (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    description character varying NOT NULL
);




CREATE TABLE clinical.variable_instance_sources (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_instance_uuid uuid NOT NULL,
    variable_instance_version_num integer NOT NULL,
    variable_source_type_uuid uuid NOT NULL,
    fhir_id character varying,
    other_source_message character varying,
    artifact_reference_uuid uuid,
    fhir_path character varying
);




CREATE TABLE clinical.variable_instance_versioned_relationships_versioned (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_instance_uuid_from uuid NOT NULL,
    variable_instance_uuid_to uuid NOT NULL,
    variable_instance_version_num_from integer NOT NULL,
    variable_instance_version_num_to integer NOT NULL,
    relationship_config_uuid uuid NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    version_num integer NOT NULL,
    created_by character varying NOT NULL,
    updated_by character varying,
    patient_uuid uuid NOT NULL,
    relationship_config_version_num integer NOT NULL,
    edge_value jsonb
);




CREATE TABLE clinical.variable_keys (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    display_name character varying NOT NULL,
    default_variable_unit_uuid uuid,
    data_type clinical.variabledatatype NOT NULL,
    event_date_display_name character varying,
    event_date_not_applicable boolean,
    help_text character varying,
    placeholder_text character varying,
    is_entity boolean NOT NULL,
    form_display_name character varying,
    deprecated boolean NOT NULL
);




CREATE TABLE clinical.work_order_variable_instance_versioned_association (
    work_order_uuid uuid NOT NULL,
    variable_instance_uuid uuid NOT NULL,
    variable_instance_version_num integer NOT NULL,
    work_order_attribute_group_uuid uuid,
    is_input boolean DEFAULT false,
    is_output boolean DEFAULT false,
    work_order_attribute_uuid uuid
);




CREATE TABLE clinical.work_orders (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL,
    description character varying NOT NULL,
    status clinical.workorderstatus NOT NULL,
    system_first_completed_at timestamp with time zone,
    work_order_archive_state clinical.workorderarchivestate NOT NULL,
    patient_uuid uuid NOT NULL,
    work_order_type_uuid uuid,
    decline_reason clinical.workorderdeclinereason,
    decline_reason_details character varying,
    assignee_user_sub character varying(100),
    time_to_complete_sec integer
);




CREATE MATERIALIZED VIEW clinical.variable_history_and_lineage AS
 WITH exportable_patients AS (
         SELECT DISTINCT work_orders.patient_uuid
           FROM clinical.work_orders
          WHERE (work_orders.status = 'WORK_ORDER_STATUS_COMPLETED'::clinical.workorderstatus)
        UNION
         SELECT patient_consent_status.patient_uuid
           FROM clinical.patient_consent_status
          WHERE (patient_consent_status.consent_status <> ALL (ARRAY['READY_TO_CONSENT'::clinical.consentstatus, 'NOT_READY_TO_CONSENT'::clinical.consentstatus]))
        ), variables AS (
         SELECT variable_instances_versioned.patient_uuid,
            variable_instances_versioned.uuid AS variable_uuid,
                CASE
                    WHEN (variable_instances_versioned.user_status IS NOT NULL) THEN variable_instances_versioned.user_value
                    ELSE variable_instances_versioned.etl_value
                END AS value,
            variable_instances_versioned.updated_at,
            variable_instances_versioned.created_by,
            variable_instances_versioned.version_num,
            variable_keys.name,
            variable_keys.display_name
           FROM ((clinical.variable_instances_versioned
             JOIN clinical.variable_configs ON ((variable_configs.uuid = variable_instances_versioned.variable_config_uuid)))
             JOIN clinical.variable_keys ON ((variable_keys.uuid = variable_configs.variable_key_uuid)))
          WHERE (variable_instances_versioned.patient_uuid IN ( SELECT exportable_patients.patient_uuid
                   FROM exportable_patients))
        ), relations AS (
         SELECT variable_instance_versioned_relationships_versioned.variable_instance_uuid_from AS from_uuid,
            variable_instance_versioned_relationships_versioned.variable_instance_version_num_from AS from_version,
            variable_instance_versioned_relationships_versioned.variable_instance_uuid_to AS to_uuid,
            variable_instance_versioned_relationships_versioned.variable_instance_version_num_to AS to_version,
            variable_keys_1.name AS from_name,
            variable_keys_2.name AS to_name,
            variable_config_relationships.relationship_type,
            variable_instance_versioned_relationships_versioned.end_date
           FROM (((((((clinical.variable_instance_versioned_relationships_versioned
             JOIN clinical.variable_config_relationships ON (((variable_config_relationships.uuid = variable_instance_versioned_relationships_versioned.relationship_config_uuid) AND (variable_config_relationships.version_num = variable_instance_versioned_relationships_versioned.relationship_config_version_num))))
             JOIN clinical.variable_instances_versioned variable_instances_versioned_1 ON (((variable_instance_versioned_relationships_versioned.variable_instance_uuid_from = variable_instances_versioned_1.uuid) AND (variable_instance_versioned_relationships_versioned.variable_instance_version_num_from = variable_instances_versioned_1.version_num))))
             JOIN clinical.variable_configs variable_configs_1 ON ((variable_configs_1.uuid = variable_instances_versioned_1.variable_config_uuid)))
             JOIN clinical.variable_keys variable_keys_1 ON ((variable_keys_1.uuid = variable_configs_1.variable_key_uuid)))
             JOIN clinical.variable_instances_versioned variable_instances_versioned_2 ON (((variable_instance_versioned_relationships_versioned.variable_instance_uuid_to = variable_instances_versioned_2.uuid) AND (variable_instance_versioned_relationships_versioned.variable_instance_version_num_to = variable_instances_versioned_2.version_num))))
             JOIN clinical.variable_configs variable_configs_2 ON ((variable_configs_2.uuid = variable_instances_versioned_2.variable_config_uuid)))
             JOIN clinical.variable_keys variable_keys_2 ON ((variable_keys_2.uuid = variable_configs_2.variable_key_uuid)))
          WHERE (variable_instance_versioned_relationships_versioned.patient_uuid IN ( SELECT exportable_patients.patient_uuid
                   FROM exportable_patients))
        ), fhir_resources AS (
         SELECT relations.from_uuid AS variable_uuid,
            relations.from_version AS version_num,
            jsonb_agg(DISTINCT relations.to_uuid) FILTER (WHERE (relations.to_uuid IS NOT NULL)) AS fhir_resource_uuids
           FROM relations
          WHERE (((relations.to_name)::text = 'FhirResource'::text) AND (relations.relationship_type = 'DERIVED_FROM'::clinical.variablerelationshiptype))
          GROUP BY relations.from_uuid, relations.from_version
        ), documents AS (
         SELECT variable_instance_sources.variable_instance_uuid,
            variable_instance_sources.variable_instance_version_num,
            jsonb_agg(DISTINCT artifact_references.text) FILTER (WHERE (artifact_references.text IS NOT NULL)) AS document_raw_value,
            jsonb_agg(DISTINCT
                CASE
                    WHEN (artifact_references.artifact_snapshot_uuid IS NOT NULL) THEN artifacts.name
                    ELSE artifacts_1.name
                END) FILTER (WHERE (
                CASE
                    WHEN (artifact_references.artifact_snapshot_uuid IS NOT NULL) THEN artifacts.name
                    ELSE artifacts_1.name
                END IS NOT NULL)) AS document_name,
            jsonb_agg(DISTINCT
                CASE
                    WHEN (artifact_references.artifact_snapshot_uuid IS NOT NULL) THEN artifacts.uuid
                    ELSE artifacts_1.uuid
                END) FILTER (WHERE (
                CASE
                    WHEN (artifact_references.artifact_snapshot_uuid IS NOT NULL) THEN artifacts.uuid
                    ELSE artifacts_1.uuid
                END IS NOT NULL)) AS document_uuid
           FROM ((((((clinical.variable_instance_sources
             LEFT JOIN clinical.artifact_references ON ((artifact_references.uuid = variable_instance_sources.artifact_reference_uuid)))
             LEFT JOIN clinical.artifact_snapshots ON ((artifact_snapshots.uuid = artifact_references.artifact_snapshot_uuid)))
             LEFT JOIN clinical.artifacts ON ((artifacts.uuid = artifact_snapshots.artifact_uuid)))
             LEFT JOIN clinical.artifact_snapshot_transcripts ON ((artifact_snapshot_transcripts.uuid = artifact_references.artifact_snapshot_transcript_uuid)))
             LEFT JOIN clinical.artifact_snapshots artifact_snapshots_1 ON ((artifact_snapshots_1.uuid = artifact_snapshot_transcripts.artifact_snapshot_uuid)))
             LEFT JOIN clinical.artifacts artifacts_1 ON ((artifacts_1.uuid = artifact_snapshots_1.artifact_uuid)))
          WHERE (variable_instance_sources.artifact_reference_uuid IS NOT NULL)
          GROUP BY variable_instance_sources.variable_instance_uuid, variable_instance_sources.variable_instance_version_num
        ), forms AS (
         SELECT work_order_variable_instance_versioned_association.variable_instance_uuid,
            work_order_variable_instance_versioned_association.variable_instance_version_num,
            jsonb_agg(DISTINCT work_orders.name) FILTER (WHERE (work_orders.name IS NOT NULL)) AS form_name
           FROM (clinical.work_order_variable_instance_versioned_association
             JOIN clinical.work_orders ON ((work_orders.uuid = work_order_variable_instance_versioned_association.work_order_uuid)))
          WHERE ((work_order_variable_instance_versioned_association.is_output IS TRUE) AND (work_orders.patient_uuid IN ( SELECT exportable_patients.patient_uuid
                   FROM exportable_patients)))
          GROUP BY work_order_variable_instance_versioned_association.variable_instance_uuid, work_order_variable_instance_versioned_association.variable_instance_version_num
        ), lineage AS (
         SELECT variables.patient_uuid,
            variables.variable_uuid,
            variables.value,
            variables.updated_at,
            variables.created_by,
            variables.version_num,
            variables.name,
            variables.display_name,
            fhir_resources.fhir_resource_uuids,
            documents.document_raw_value,
            documents.document_name,
            documents.document_uuid,
            forms.form_name,
            now() AS last_refreshed
           FROM (((variables
             LEFT JOIN fhir_resources ON (((variables.variable_uuid = fhir_resources.variable_uuid) AND (variables.version_num = fhir_resources.version_num))))
             LEFT JOIN documents ON (((variables.variable_uuid = documents.variable_instance_uuid) AND (variables.version_num = documents.variable_instance_version_num))))
             LEFT JOIN forms ON (((variables.variable_uuid = forms.variable_instance_uuid) AND (variables.version_num = forms.variable_instance_version_num))))
          WHERE ((variables.name)::text <> ALL ((ARRAY['SourceMessage'::character varying, 'SourceMessage.s3_path'::character varying, 'SourceMessage.message_type'::character varying, 'SourceMessage.ingestion_date'::character varying, 'FhirResource'::character varying, 'FhirResource.fhir_server_uuid'::character varying, 'FhirResource.fhir_id'::character varying, 'FhirResource.s3_path'::character varying])::text[]))
        )
 SELECT lineage.patient_uuid,
    lineage.variable_uuid,
    lineage.value,
    lineage.updated_at,
    lineage.created_by,
    lineage.version_num,
    lineage.name,
    lineage.display_name,
    lineage.fhir_resource_uuids,
    lineage.document_raw_value,
    lineage.document_name,
    lineage.document_uuid,
    lineage.form_name,
    lineage.last_refreshed
   FROM lineage
  WITH NO DATA;




CREATE VIEW clinical.variable_instance_versioned_relationships AS
 SELECT variable_instance_versioned_relationships_versioned.uuid,
    variable_instance_versioned_relationships_versioned.version_num,
    variable_instance_versioned_relationships_versioned.start_date,
    variable_instance_versioned_relationships_versioned.end_date,
    variable_instance_versioned_relationships_versioned.created_at,
    variable_instance_versioned_relationships_versioned.updated_at,
    variable_instance_versioned_relationships_versioned.created_by,
    variable_instance_versioned_relationships_versioned.updated_by,
    variable_instance_versioned_relationships_versioned.relationship_config_uuid,
    variable_instance_versioned_relationships_versioned.patient_uuid,
    variable_instance_versioned_relationships_versioned.variable_instance_uuid_from,
    variable_instance_versioned_relationships_versioned.variable_instance_version_num_from,
    variable_instance_versioned_relationships_versioned.variable_instance_uuid_to,
    variable_instance_versioned_relationships_versioned.variable_instance_version_num_to,
    variable_instance_versioned_relationships_versioned.edge_value
   FROM clinical.variable_instance_versioned_relationships_versioned
  WHERE (variable_instance_versioned_relationships_versioned.end_date = 'infinity'::timestamp without time zone);




CREATE VIEW clinical.variable_instances AS
 SELECT variable_instances_versioned.uuid,
    variable_instances_versioned.version_num,
    variable_instances_versioned.start_date,
    variable_instances_versioned.end_date,
    variable_instances_versioned.created_at,
    variable_instances_versioned.updated_at,
    variable_instances_versioned.variable_config_uuid,
    variable_instances_versioned.patient_uuid,
    variable_instances_versioned.event_date,
    variable_instances_versioned.etl_run_uuid,
    variable_instances_versioned.etl_value,
    variable_instances_versioned.encrypted_etl_value,
        CASE
            WHEN (variable_instances_versioned.user_status IS NOT NULL) THEN variable_instances_versioned.user_value
            ELSE variable_instances_versioned.etl_value
        END AS json_value,
    variable_instances_versioned.etl_metadata,
    variable_instances_versioned.etl_status,
    variable_instances_versioned.user_value,
    variable_instances_versioned.encrypted_user_value,
    variable_instances_versioned.user_metadata,
    variable_instances_versioned.user_status,
    variable_instances_versioned.user_confirmed
   FROM clinical.variable_instances_versioned
  WHERE (variable_instances_versioned.end_date = 'infinity'::timestamp without time zone);




CREATE VIEW clinical.variable_instance_relationships AS
 SELECT variable_instance_versioned_relationships.uuid,
    variable_instance_versioned_relationships.version_num,
    variable_instance_versioned_relationships.start_date,
    variable_instance_versioned_relationships.end_date,
    variable_instance_versioned_relationships.created_at,
    variable_instance_versioned_relationships.updated_at,
    variable_instance_versioned_relationships.created_by,
    variable_instance_versioned_relationships.updated_by,
    variable_instance_versioned_relationships.relationship_config_uuid,
    variable_instance_versioned_relationships.patient_uuid,
    variable_instance_versioned_relationships.variable_instance_uuid_from,
    variable_instance_versioned_relationships.variable_instance_uuid_to,
    variable_instance_versioned_relationships.variable_instance_version_num_from,
    variable_instance_versioned_relationships.variable_instance_version_num_to,
    variable_instance_versioned_relationships.edge_value
   FROM ((clinical.variable_instance_versioned_relationships
     JOIN ( SELECT variable_instances.uuid,
            variable_instances.version_num
           FROM clinical.variable_instances) anon_1 ON (((anon_1.uuid = variable_instance_versioned_relationships.variable_instance_uuid_from) AND (anon_1.version_num = variable_instance_versioned_relationships.variable_instance_version_num_from))))
     JOIN ( SELECT variable_instances.uuid,
            variable_instances.version_num
           FROM clinical.variable_instances) anon_2 ON (((anon_2.uuid = variable_instance_versioned_relationships.variable_instance_uuid_to) AND (anon_2.version_num = variable_instance_versioned_relationships.variable_instance_version_num_to))));




CREATE TABLE clinical.variable_issue_dismiss_reasons (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    description character varying NOT NULL
);




CREATE TABLE clinical.variable_key_domain_association (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_key_uuid uuid NOT NULL,
    variable_domain_uuid uuid NOT NULL
);




CREATE TABLE clinical.variable_key_ontology_association (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_key_uuid uuid NOT NULL,
    ontology_uuid uuid NOT NULL
);




CREATE TABLE clinical.variable_key_unit_association (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    variable_key_uuid uuid NOT NULL,
    variable_unit_uuid uuid NOT NULL
);




CREATE TABLE clinical.variable_source_type (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    description character varying NOT NULL
);




CREATE TABLE clinical.variable_units (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    name character varying NOT NULL,
    unit character varying,
    system character varying,
    code character varying
);




CREATE VIEW clinical.variable_view AS
 SELECT variable_instances.patient_uuid,
    variable_keys.name,
    variable_keys.display_name,
    variable_keys.data_type,
    variable_instances.uuid,
    variable_instances.version_num,
    variable_instances.json_value AS value,
    variable_instances.event_date,
    variable_configs.is_phi
   FROM ((clinical.variable_instances
     JOIN clinical.variable_configs ON ((variable_configs.uuid = variable_instances.variable_config_uuid)))
     JOIN clinical.variable_keys ON ((variable_keys.uuid = variable_configs.variable_key_uuid)));




CREATE VIEW clinical.variable_view_with_relationships AS
 SELECT variable_view.patient_uuid,
    variable_view.name,
    variable_view.display_name,
    variable_view.data_type,
    variable_view.uuid,
    variable_view.version_num,
    variable_view.value,
    variable_view.event_date,
    variable_view.is_phi,
    variable_instance_relationships.uuid AS relationship_uuid,
    variable_config_relationships.relationship_type,
    variable_view_1.name AS related_name,
    variable_view_1.display_name AS related_display_name,
    variable_view_1.uuid AS related_uuid,
    variable_view_1.version_num AS related_version_num,
    variable_view_1.value AS related_value,
    variable_view_1.event_date AS related_event_date,
    variable_view_1.is_phi AS related_is_phi
   FROM (((clinical.variable_view
     JOIN clinical.variable_instance_relationships ON (((variable_instance_relationships.patient_uuid = variable_view.patient_uuid) AND (variable_instance_relationships.variable_instance_uuid_from = variable_view.uuid))))
     JOIN clinical.variable_config_relationships ON ((variable_config_relationships.uuid = variable_instance_relationships.relationship_config_uuid)))
     JOIN clinical.variable_view variable_view_1 ON ((variable_view_1.uuid = variable_instance_relationships.variable_instance_uuid_to)))
UNION ALL
 SELECT variable_view.patient_uuid,
    variable_view.name,
    variable_view.display_name,
    variable_view.data_type,
    variable_view.uuid,
    variable_view.version_num,
    variable_view.value,
    variable_view.event_date,
    variable_view.is_phi,
    variable_instance_relationships.uuid AS relationship_uuid,
    variable_config_relationships.relationship_type,
    variable_view_1.name AS related_name,
    variable_view_1.display_name AS related_display_name,
    variable_view_1.uuid AS related_uuid,
    variable_view_1.version_num AS related_version_num,
    variable_view_1.value AS related_value,
    variable_view_1.event_date AS related_event_date,
    variable_view_1.is_phi AS related_is_phi
   FROM (((clinical.variable_view
     JOIN clinical.variable_instance_relationships ON (((variable_instance_relationships.patient_uuid = variable_view.patient_uuid) AND (variable_instance_relationships.variable_instance_uuid_to = variable_view.uuid))))
     JOIN clinical.variable_config_relationships ON ((variable_config_relationships.uuid = variable_instance_relationships.relationship_config_uuid)))
     JOIN clinical.variable_view variable_view_1 ON ((variable_view_1.uuid = variable_instance_relationships.variable_instance_uuid_from)));




CREATE TABLE clinical.work_order_artifact_association (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    work_order_uuid uuid NOT NULL,
    artifact_uuid uuid NOT NULL
);




CREATE TABLE clinical.work_order_artifact_type_overrides (
    number_of_artifacts_minimum integer,
    number_of_artifacts_maximum integer,
    input_data_location_is_read_only boolean,
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    work_order_uuid uuid NOT NULL,
    artifact_type_uuid uuid NOT NULL
);




CREATE TABLE clinical.work_order_attribute_group_type_configuration (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    is_hidden boolean,
    work_order_uuid uuid NOT NULL,
    wot_configuration_attribute_group_type_uuid uuid NOT NULL
);




CREATE TABLE clinical.work_order_attribute_groups (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    work_order_uuid uuid NOT NULL,
    attribute_group_type_configuration_uuid uuid NOT NULL,
    "position" integer NOT NULL,
    parent_attribute_group_uuid uuid,
    is_hidden boolean
);




CREATE TABLE clinical.work_order_attributes (
    min_value double precision,
    max_value double precision,
    min_string_length integer,
    max_string_length integer,
    numeric_options double precision[],
    string_regex_pattern character varying,
    string_regex_message character varying,
    string_regex_example character varying,
    db_reference_entity_type character varying,
    db_reference_preconfigured_params json,
    db_reference_searchable_field character varying,
    db_reference_key_path character varying,
    db_reference_value_path character varying,
    unstructured_object_key_definitions json,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    bypassed_validation boolean DEFAULT false,
    json_value jsonb NOT NULL,
    is_null boolean NOT NULL,
    is_required boolean,
    is_hidden boolean,
    is_editable boolean DEFAULT true NOT NULL,
    is_worklist_editable boolean DEFAULT false NOT NULL,
    attribute_uuid uuid NOT NULL,
    uncommitted_json_input json,
    work_order_uuid uuid NOT NULL,
    attribute_key_configuration_uuid uuid NOT NULL,
    string_options character varying[],
    attribute_group_uuid uuid,
    db_reference_ui_display_params json,
    time_to_complete_sec integer
);




CREATE TABLE clinical.work_order_dependencies (
    uuid uuid NOT NULL,
    link_type clinical.workorderlinktype NOT NULL,
    from_work_order_uuid uuid NOT NULL,
    to_work_order_uuid uuid NOT NULL
);




CREATE TABLE clinical.work_order_generic_types (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL
);




CREATE TABLE clinical.work_order_type_groups (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL,
    "position" integer NOT NULL
);




CREATE TABLE clinical.work_order_types (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    abbreviation character varying,
    description character varying NOT NULL,
    "position" integer,
    deprecated boolean,
    group_uuid uuid,
    generic_type_uuid uuid
);




CREATE TABLE clinical.wot_configuration_artifact_type (
    number_of_artifacts_minimum integer,
    number_of_artifacts_maximum integer,
    input_data_location_is_read_only boolean,
    input_data_format clinical.inputdataformat,
    artifact_origin clinical.artifactorigin,
    work_order_type_uuid uuid NOT NULL,
    artifact_type_uuid uuid NOT NULL,
    authored_date_attribute_key_uuid uuid,
    event_date_attribute_key_uuid uuid
);




CREATE TABLE clinical.wot_configuration_attribute_group_type (
    uuid uuid NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp(),
    "position" integer NOT NULL,
    is_repeatable boolean,
    deprecated boolean,
    work_order_type_uuid uuid NOT NULL,
    attribute_group_type_uuid uuid NOT NULL,
    entity_attribute_key_uuid uuid,
    parent_attribute_group_type_uuid uuid,
    create_by_default boolean DEFAULT false,
    is_hidden boolean,
    user_confirmed_attribute_key_uuid uuid,
    add_button_display_name character varying,
    header_description character varying,
    header_display_name character varying,
    title_empty_display_name character varying,
    title_display_configuration jsonb,
    show_add_button boolean DEFAULT true,
    show_remove_button boolean DEFAULT true
);




CREATE TABLE clinical.wot_configuration_next_work_orders (
    uuid uuid NOT NULL,
    previous_work_order_type_uuid uuid NOT NULL,
    next_work_order_type_uuid uuid NOT NULL
);




CREATE TABLE clinical.wot_configuration_variable_keys (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    updated_at timestamp with time zone DEFAULT statement_timestamp() NOT NULL,
    work_order_type_uuid uuid NOT NULL,
    variable_key_uuid uuid NOT NULL,
    variable_source_type_attribute_key_uuid uuid,
    variable_source_value_attribute_key_uuid uuid,
    variable_event_date_attribute_key_uuid uuid,
    variable_value_attribute_key_uuid uuid,
    variable_unit_attribute_key_uuid uuid,
    variable_value_unknown_attribute_key_uuid uuid,
    variable_ontology_attribute_key_uuid uuid,
    variable_attribute_group_type_uuid uuid,
    on_value_update_associate_variable_and_related_variables boolean,
    is_input boolean DEFAULT false,
    is_output boolean DEFAULT false,
    index integer,
    related_variable_key_uuid uuid
);




ALTER TABLE ONLY clinical.omop_concepts ALTER COLUMN concept_id SET DEFAULT nextval('clinical.omop_concepts_concept_id_seq'::regclass);



ALTER TABLE ONLY clinical.artifact_references
    ADD CONSTRAINT artifact_references_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.artifact_snapshot_attributes
    ADD CONSTRAINT artifact_snapshot_attributes_attribute_uuid_key UNIQUE (attribute_uuid);



ALTER TABLE ONLY clinical.artifact_snapshot_attributes
    ADD CONSTRAINT artifact_snapshot_attributes_pkey PRIMARY KEY (artifact_snapshot_uuid, attribute_uuid);



ALTER TABLE ONLY clinical.artifact_snapshot_previews
    ADD CONSTRAINT artifact_snapshot_previews_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.artifact_snapshot_transcripts
    ADD CONSTRAINT artifact_snapshot_transcripts_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.artifact_snapshots
    ADD CONSTRAINT artifact_snapshots_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.artifact_type_configurations
    ADD CONSTRAINT artifact_type_configurations_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.artifact_types
    ADD CONSTRAINT artifact_types_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.artifacts
    ADD CONSTRAINT artifacts_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.attribute_group_types
    ADD CONSTRAINT attribute_group_types_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.attribute_key_configurations
    ADD CONSTRAINT attribute_key_configurations_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.attribute_keys
    ADD CONSTRAINT attribute_keys_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.attribute_sources
    ADD CONSTRAINT attribute_sources_pkey PRIMARY KEY (attribute_uuid, artifact_reference_uuid);



ALTER TABLE ONLY clinical.biomarker_test_providers
    ADD CONSTRAINT biomarker_test_providers_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.biomarker_tests_human_genes_association
    ADD CONSTRAINT biomarker_tests_human_genes_association_pkey PRIMARY KEY (biomarker_test_uuid, gene_uuid);



ALTER TABLE ONLY clinical.biomarker_tests
    ADD CONSTRAINT biomarker_tests_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.consent_decline_reasons
    ADD CONSTRAINT consent_decline_reasons_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.study_consent_documents
    ADD CONSTRAINT consent_document_folder UNIQUE (consent_document_folder);



ALTER TABLE ONLY clinical.consent_language_configs
    ADD CONSTRAINT consent_language_configs_consent_language_key UNIQUE (consent_language);



ALTER TABLE ONLY clinical.consent_language_configs
    ADD CONSTRAINT consent_language_configs_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.data_migration_runs
    ADD CONSTRAINT data_migration_runs_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.data_migration_runs
    ADD CONSTRAINT data_migration_runs_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.data_migration_runs
    ADD CONSTRAINT data_migration_runs_sequence_num_key UNIQUE (sequence_num);



ALTER TABLE ONLY clinical.etl_appointment
    ADD CONSTRAINT etl_appointment_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.etl_cancer_summary
    ADD CONSTRAINT etl_cancer_summary_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.etl_demographics
    ADD CONSTRAINT etl_demographics_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.etl_events
    ADD CONSTRAINT etl_events_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.etl_patient_practitioner
    ADD CONSTRAINT etl_patient_practitioner_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.etl_runs
    ADD CONSTRAINT etl_runs_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.etl_timeline_event
    ADD CONSTRAINT etl_timeline_event_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.fhir_server
    ADD CONSTRAINT fhir_server_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.fhir_server
    ADD CONSTRAINT fhir_server_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.file_types
    ADD CONSTRAINT file_types_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.human_genes
    ADD CONSTRAINT human_gene_ncbi_id_name_unique_constraint UNIQUE (ncbi_entrez_gene_id, name);



ALTER TABLE ONLY clinical.human_genes
    ADD CONSTRAINT human_genes_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.issue_variable_instance_versioned_association
    ADD CONSTRAINT issue_uuid_variable_uuid_version_num PRIMARY KEY (variable_instance_uuid, variable_version_num, issue_uuid);



ALTER TABLE ONLY clinical.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.biomarker_test_providers
    ADD CONSTRAINT laboratory_name_institution_name_unique_constraint UNIQUE (laboratory_name, institution_name);



ALTER TABLE ONLY clinical.medical_code_ontologies
    ADD CONSTRAINT medical_code_ontologies_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.medical_codes
    ADD CONSTRAINT medical_codes_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.qc_rules
    ADD CONSTRAINT module_python_function_pk UNIQUE (module, python_function);



ALTER TABLE ONLY clinical.omop_concepts
    ADD CONSTRAINT omop_concepts_pkey PRIMARY KEY (concept_id);



ALTER TABLE ONLY clinical.medical_code_ontologies
    ADD CONSTRAINT ontology_name_version_publication_date_unique_constraint UNIQUE (name, version, publication_date);



ALTER TABLE ONLY clinical.medical_code_ontologies
    ADD CONSTRAINT ontology_system_url_version_unique_constraint UNIQUE (system_url, version);



ALTER TABLE ONLY clinical.medical_codes
    ADD CONSTRAINT ontology_uuid_code_title_unique_constraint UNIQUE (ontology_uuid, code, title);



ALTER TABLE ONLY clinical.patient_active_consent_documents
    ADD CONSTRAINT patient_active_consent_documents_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.patient_consent_events
    ADD CONSTRAINT patient_consent_events_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.patient_consent_status
    ADD CONSTRAINT patient_consent_status_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.patient_ids
    ADD CONSTRAINT patient_ids_fhir_server_uuid_external_id_key UNIQUE (fhir_server_uuid, external_id);



ALTER TABLE ONLY clinical.patient_ids
    ADD CONSTRAINT patient_ids_fhir_server_uuid_fhir_id_key UNIQUE (fhir_server_uuid, fhir_id);



ALTER TABLE ONLY clinical.patient_ids
    ADD CONSTRAINT patient_ids_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.patient_ids
    ADD CONSTRAINT patient_ids_sequence_num UNIQUE (sequence_num);



ALTER TABLE ONLY clinical.patient_active_consent_documents
    ADD CONSTRAINT patient_uuid_study_consent_document_uuid UNIQUE (patient_uuid, study_consent_document_uuid);



ALTER TABLE ONLY clinical.patient_consent_status
    ADD CONSTRAINT patient_uuid_study_uuid UNIQUE (patient_uuid, study_uuid);



ALTER TABLE ONLY clinical.qc_rule_eval_results
    ADD CONSTRAINT qc_rule_eval_results_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.qc_rule_variable_config_association
    ADD CONSTRAINT qc_rule_uuid_variable_config_uuid PRIMARY KEY (qc_rule_uuid, variable_config_uuid);



ALTER TABLE ONLY clinical.qc_rules
    ADD CONSTRAINT qc_rules_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.qc_rule_eval_result_variable_instance_versioned_association
    ADD CONSTRAINT qcr_eval_result_uuid_variable_uuid_version_num PRIMARY KEY (variable_instance_uuid, variable_version_num, qc_rule_eval_result_uuid);



ALTER TABLE ONLY clinical.site_fhir_server_association
    ADD CONSTRAINT site_fhir_server_association_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.site_organization_site_association
    ADD CONSTRAINT site_organization_site_association_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.site_organizations
    ADD CONSTRAINT site_organizations_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.site_study_association
    ADD CONSTRAINT site_study_association_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.site_study_details
    ADD CONSTRAINT site_study_details_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.sites
    ADD CONSTRAINT sites_sequence_num UNIQUE (sequence_num);



ALTER TABLE ONLY clinical.string_options
    ADD CONSTRAINT string_options_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.string_options
    ADD CONSTRAINT string_options_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.studies
    ADD CONSTRAINT studies_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.study_consent_document_fields
    ADD CONSTRAINT study_consent_document_fields_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.study_consent_document_fields
    ADD CONSTRAINT study_consent_document_uuid_consent_language_signing_role UNIQUE (study_consent_document_uuid, consent_language, signing_role);



ALTER TABLE ONLY clinical.study_consent_documents
    ADD CONSTRAINT study_consent_documents_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.study_consent_documents
    ADD CONSTRAINT study_consent_version_uuid_site_uuid UNIQUE (study_consent_version_uuid, site_uuid);



ALTER TABLE ONLY clinical.study_consent_versions
    ADD CONSTRAINT study_consent_versions_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.study_relationships
    ADD CONSTRAINT study_relationships_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.study_versions
    ADD CONSTRAINT study_uuid_protocol_version UNIQUE (study_uuid, version_major, version_minor);



ALTER TABLE ONLY clinical.study_consent_versions
    ADD CONSTRAINT study_version_uuid_study_consent_version UNIQUE (study_version_uuid, version_major, version_minor);



ALTER TABLE ONLY clinical.study_versions
    ADD CONSTRAINT study_versions_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_units
    ADD CONSTRAINT system_code UNIQUE (system, code);



ALTER TABLE ONLY clinical.timezones
    ADD CONSTRAINT timezones_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_instance_versioned_relationships_versioned
    ADD CONSTRAINT unique_idx_variable_instances_to_from UNIQUE (variable_instance_uuid_from, variable_instance_version_num_from, variable_instance_uuid_to, variable_instance_version_num_to, relationship_config_uuid, relationship_config_version_num, version_num);



ALTER TABLE ONLY clinical.variable_config_relationships
    ADD CONSTRAINT v_c_uuid_from_v_c_uuid_to_rel_type_rel_label_version_num UNIQUE (variable_config_uuid_from, variable_config_uuid_to, relationship_type, relationship_label, version_num);



ALTER TABLE ONLY clinical.variable_cdisc_mappings
    ADD CONSTRAINT variable_cdisc_mappings_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_config_extractions
    ADD CONSTRAINT variable_config_extractions_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_config_relationship_extractions
    ADD CONSTRAINT variable_config_relationship_extractions_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_config_relationships
    ADD CONSTRAINT variable_config_relationships_pkey PRIMARY KEY (uuid, version_num);



ALTER TABLE ONLY clinical.variable_config_source_contexts
    ADD CONSTRAINT variable_config_source_contexts_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_configs
    ADD CONSTRAINT variable_configs_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_domains
    ADD CONSTRAINT variable_domains_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_edit_reasons
    ADD CONSTRAINT variable_edit_reasons_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_instance_sources
    ADD CONSTRAINT variable_instance_sources_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_instance_versioned_relationships_versioned
    ADD CONSTRAINT variable_instance_versioned_relationships_versioned_pkey PRIMARY KEY (uuid, version_num);



ALTER TABLE ONLY clinical.variable_instances_versioned
    ADD CONSTRAINT variable_instances_pkey PRIMARY KEY (uuid, version_num);



ALTER TABLE ONLY clinical.variable_issue_dismiss_reasons
    ADD CONSTRAINT variable_issue_dismiss_reasons_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_key_domain_association
    ADD CONSTRAINT variable_key_domain_association_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_key_ontology_association
    ADD CONSTRAINT variable_key_ontology_association_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_key_unit_association
    ADD CONSTRAINT variable_key_unit_association_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_configs
    ADD CONSTRAINT variable_key_uuid_version UNIQUE (variable_key_uuid, version);



ALTER TABLE ONLY clinical.variable_keys
    ADD CONSTRAINT variable_keys_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_source_type
    ADD CONSTRAINT variable_source_type_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_units
    ADD CONSTRAINT variable_units_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.variable_units
    ADD CONSTRAINT variable_units_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.variable_units
    ADD CONSTRAINT variable_units_unit_key UNIQUE (unit);



ALTER TABLE ONLY clinical.work_order_artifact_association
    ADD CONSTRAINT work_order_artifact_association_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.work_order_artifact_type_overrides
    ADD CONSTRAINT work_order_artifact_type_overrides_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.work_order_attribute_group_type_configuration
    ADD CONSTRAINT work_order_attribute_group_type_configuration_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.work_order_attribute_groups
    ADD CONSTRAINT work_order_attribute_groups_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.work_order_attributes
    ADD CONSTRAINT work_order_attributes_attribute_uuid_key UNIQUE (attribute_uuid);



ALTER TABLE ONLY clinical.work_order_attributes
    ADD CONSTRAINT work_order_attributes_pkey PRIMARY KEY (work_order_uuid, attribute_uuid);



ALTER TABLE ONLY clinical.work_order_dependencies
    ADD CONSTRAINT work_order_dependencies_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.work_order_generic_types
    ADD CONSTRAINT work_order_generic_types_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.work_order_generic_types
    ADD CONSTRAINT work_order_generic_types_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.work_order_type_groups
    ADD CONSTRAINT work_order_type_groups_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.work_order_type_groups
    ADD CONSTRAINT work_order_type_groups_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT work_order_type_uuid_variable_key_uuid UNIQUE (work_order_type_uuid, variable_key_uuid, related_variable_key_uuid);



ALTER TABLE ONLY clinical.work_order_types
    ADD CONSTRAINT work_order_types_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.work_order_types
    ADD CONSTRAINT work_order_types_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.work_order_variable_instance_versioned_association
    ADD CONSTRAINT work_order_variable_instance_versioned_association_pk PRIMARY KEY (work_order_uuid, variable_instance_uuid, variable_instance_version_num);



ALTER TABLE ONLY clinical.work_orders
    ADD CONSTRAINT work_orders_name_key UNIQUE (name);



ALTER TABLE ONLY clinical.work_orders
    ADD CONSTRAINT work_orders_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.wot_configuration_artifact_type
    ADD CONSTRAINT wot_configuration_artifact_type_pkey PRIMARY KEY (work_order_type_uuid, artifact_type_uuid);



ALTER TABLE ONLY clinical.wot_configuration_attribute_group_type
    ADD CONSTRAINT wot_configuration_attribute_group_type_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.wot_configuration_next_work_orders
    ADD CONSTRAINT wot_configuration_next_work_orders_pkey PRIMARY KEY (uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT wot_configuration_variable_keys_pkey PRIMARY KEY (uuid);



CREATE INDEX etl_appointment_patient_uuid_idx ON clinical.etl_appointment USING btree (patient_uuid, start_date);



CREATE UNIQUE INDEX etl_cancer_summary_patient_uuid_idx ON clinical.etl_cancer_summary USING btree (patient_uuid);



CREATE UNIQUE INDEX etl_demographics_patient_uuid_idx ON clinical.etl_demographics USING btree (patient_uuid);



CREATE INDEX etl_patient_practitioner_patient_uuid_practitioner_fhir_id ON clinical.etl_patient_practitioner USING btree (patient_uuid, practitioner_fhir_id);



CREATE INDEX etl_timeline_event_patient_uuid_swimlane_idx ON clinical.etl_timeline_event USING btree (patient_uuid, swimlane);



CREATE INDEX ix_clinical_artifact_snapshot_previews_artifact_snapshot_uuid ON clinical.artifact_snapshot_previews USING btree (artifact_snapshot_uuid);



CREATE INDEX ix_clinical_artifact_snapshot_transcripts_artifact_snap_2c75 ON clinical.artifact_snapshot_transcripts USING btree (artifact_snapshot_uuid);



CREATE INDEX ix_clinical_artifact_snapshots_artifact_uuid ON clinical.artifact_snapshots USING btree (artifact_uuid);



CREATE UNIQUE INDEX ix_clinical_artifact_types_name ON clinical.artifact_types USING btree (name);



CREATE UNIQUE INDEX ix_clinical_artifacts_barcode ON clinical.artifacts USING btree (barcode);



CREATE INDEX ix_clinical_artifacts_patient_uuid ON clinical.artifacts USING btree (patient_uuid);



CREATE UNIQUE INDEX ix_clinical_attribute_group_types_name ON clinical.attribute_group_types USING btree (name);



CREATE UNIQUE INDEX ix_clinical_attribute_keys_name ON clinical.attribute_keys USING btree (name);



CREATE INDEX ix_clinical_biomarker_tests_human_genes_association_bio_4aed ON clinical.biomarker_tests_human_genes_association USING btree (biomarker_test_uuid);



CREATE UNIQUE INDEX ix_clinical_consent_decline_reasons_name ON clinical.consent_decline_reasons USING btree (name);



CREATE INDEX ix_clinical_etl_appointment_start_date ON clinical.etl_appointment USING btree (start_date);



CREATE INDEX ix_clinical_etl_events_etl_run_uuid ON clinical.etl_events USING btree (etl_run_uuid);



CREATE INDEX ix_clinical_etl_events_name ON clinical.etl_events USING btree (name);



CREATE INDEX ix_clinical_etl_runs_created_at ON clinical.etl_runs USING btree (created_at);



CREATE INDEX ix_clinical_etl_runs_patient_uuid_created_at ON clinical.etl_runs USING btree (patient_uuid, created_at DESC NULLS LAST);



CREATE INDEX ix_clinical_etl_runs_status ON clinical.etl_runs USING btree (status);



CREATE UNIQUE INDEX ix_clinical_file_types_name ON clinical.file_types USING btree (name);



CREATE INDEX ix_clinical_issue_variable_instance_versioned_associati_b53f ON clinical.issue_variable_instance_versioned_association USING btree (issue_uuid);



CREATE INDEX ix_clinical_latest_qc_rule_eval_results_patient_uuid ON clinical.latest_qc_rule_eval_results USING btree (patient_uuid);



CREATE UNIQUE INDEX ix_clinical_latest_qc_rule_eval_results_pk ON clinical.latest_qc_rule_eval_results USING btree (qc_rule_uuid, variable_instance_uuid);



CREATE INDEX ix_clinical_patient_active_consent_documents_patient_uuid ON clinical.patient_active_consent_documents USING btree (patient_uuid);



CREATE INDEX ix_clinical_patient_consent_events_patient_uuid ON clinical.patient_consent_events USING btree (patient_uuid);



CREATE INDEX ix_clinical_patient_consent_status_patient_consent_event_uuid ON clinical.patient_consent_status USING btree (patient_consent_event_uuid);



CREATE INDEX ix_clinical_patient_consent_status_patient_uuid ON clinical.patient_consent_status USING btree (patient_uuid);



CREATE INDEX ix_clinical_patient_consent_status_study_uuid ON clinical.patient_consent_status USING btree (study_uuid);



CREATE INDEX ix_clinical_patient_ids_active ON clinical.patient_ids USING btree (active);



CREATE INDEX ix_clinical_patient_ids_is_test ON clinical.patient_ids USING btree (is_test);



CREATE INDEX ix_clinical_qc_rule_eval_result_variable_instance_versi_9458 ON clinical.qc_rule_eval_result_variable_instance_versioned_association USING btree (qc_rule_eval_result_uuid);



CREATE INDEX ix_clinical_site_fhir_server_association_fhir_server_uuid ON clinical.site_fhir_server_association USING btree (fhir_server_uuid);



CREATE INDEX ix_clinical_site_fhir_server_association_site_uuid ON clinical.site_fhir_server_association USING btree (site_uuid);



CREATE INDEX ix_clinical_site_organization_site_association_site_org_1a1e ON clinical.site_organization_site_association USING btree (site_organization_uuid);



CREATE INDEX ix_clinical_site_organization_site_association_site_uuid ON clinical.site_organization_site_association USING btree (site_uuid);



CREATE UNIQUE INDEX ix_clinical_site_organizations_name ON clinical.site_organizations USING btree (name);



CREATE INDEX ix_clinical_site_study_association_site_uuid ON clinical.site_study_association USING btree (site_uuid);



CREATE INDEX ix_clinical_site_study_association_study_uuid ON clinical.site_study_association USING btree (study_uuid);



CREATE INDEX ix_clinical_site_study_details_site_uuid ON clinical.site_study_details USING btree (site_uuid);



CREATE INDEX ix_clinical_site_study_details_study_version_uuid ON clinical.site_study_details USING btree (study_version_uuid);



CREATE UNIQUE INDEX ix_clinical_sites_name ON clinical.sites USING btree (name);



CREATE UNIQUE INDEX ix_clinical_studies_name ON clinical.studies USING btree (name);



CREATE INDEX ix_clinical_study_consent_document_fields_study_consent_75d3 ON clinical.study_consent_document_fields USING btree (study_consent_document_uuid);



CREATE INDEX ix_clinical_study_consent_documents_study_consent_version_uuid ON clinical.study_consent_documents USING btree (study_consent_version_uuid);



CREATE INDEX ix_clinical_study_consent_versions_study_version_uuid ON clinical.study_consent_versions USING btree (study_version_uuid);



CREATE INDEX ix_clinical_study_relationships_study_uuid_from ON clinical.study_relationships USING btree (study_uuid_from);



CREATE INDEX ix_clinical_study_relationships_study_uuid_to ON clinical.study_relationships USING btree (study_uuid_to);



CREATE INDEX ix_clinical_study_versions_eligibility_variable_config_uuid ON clinical.study_versions USING btree (eligibility_variable_config_uuid);



CREATE INDEX ix_clinical_study_versions_study_uuid ON clinical.study_versions USING btree (study_uuid);



CREATE UNIQUE INDEX ix_clinical_timezones_name ON clinical.timezones USING btree (name);



CREATE INDEX ix_clinical_variable_config_relationships_variable_conf_343b ON clinical.variable_config_relationships USING btree (variable_config_uuid_from);



CREATE INDEX ix_clinical_variable_config_relationships_variable_conf_a01b ON clinical.variable_config_relationships USING btree (variable_config_uuid_to);



CREATE INDEX ix_clinical_variable_config_source_contexts_variable_co_e6e5 ON clinical.variable_config_source_contexts USING btree (variable_config_uuid);



CREATE UNIQUE INDEX ix_clinical_variable_domains_name ON clinical.variable_domains USING btree (name);



CREATE UNIQUE INDEX ix_clinical_variable_edit_reasons_name ON clinical.variable_edit_reasons USING btree (name);



CREATE INDEX ix_clinical_variable_history_and_lineage_name ON clinical.variable_history_and_lineage USING btree (name);



CREATE INDEX ix_clinical_variable_history_and_lineage_patient_uuid ON clinical.variable_history_and_lineage USING btree (patient_uuid);



CREATE UNIQUE INDEX ix_clinical_variable_history_and_lineage_pk ON clinical.variable_history_and_lineage USING btree (variable_uuid, version_num);



CREATE INDEX ix_clinical_variable_instance_relationships_relationshi_112e ON clinical.variable_instance_versioned_relationships_versioned USING btree (relationship_config_uuid);



CREATE INDEX ix_clinical_variable_instance_relationships_variable_in_87c5 ON clinical.variable_instance_versioned_relationships_versioned USING btree (variable_instance_uuid_from);



CREATE INDEX ix_clinical_variable_instance_relationships_variable_in_da72 ON clinical.variable_instance_versioned_relationships_versioned USING btree (variable_instance_uuid_to);



CREATE INDEX ix_clinical_variable_instance_sources_variable_instance_uuid ON clinical.variable_instance_sources USING btree (variable_instance_uuid);



CREATE INDEX ix_clinical_variable_instance_versioned_relationships_v_312d ON clinical.variable_instance_versioned_relationships_versioned USING btree (patient_uuid);



CREATE INDEX ix_clinical_variable_instances_versioned_patient_uuid ON clinical.variable_instances_versioned USING btree (patient_uuid);



CREATE INDEX ix_clinical_variable_instances_versioned_variable_config_uuid ON clinical.variable_instances_versioned USING btree (variable_config_uuid);



CREATE UNIQUE INDEX ix_clinical_variable_issue_dismiss_reasons_name ON clinical.variable_issue_dismiss_reasons USING btree (name);



CREATE INDEX ix_clinical_variable_key_domain_association_variable_do_4096 ON clinical.variable_key_domain_association USING btree (variable_domain_uuid);



CREATE INDEX ix_clinical_variable_key_domain_association_variable_key_uuid ON clinical.variable_key_domain_association USING btree (variable_key_uuid);



CREATE INDEX ix_clinical_variable_key_ontology_association_ontology_uuid ON clinical.variable_key_ontology_association USING btree (ontology_uuid);



CREATE INDEX ix_clinical_variable_key_ontology_association_variable_key_uuid ON clinical.variable_key_ontology_association USING btree (variable_key_uuid);



CREATE INDEX ix_clinical_variable_key_unit_association_variable_key_uuid ON clinical.variable_key_unit_association USING btree (variable_key_uuid);



CREATE INDEX ix_clinical_variable_key_unit_association_variable_unit_uuid ON clinical.variable_key_unit_association USING btree (variable_unit_uuid);



CREATE UNIQUE INDEX ix_clinical_variable_keys_name ON clinical.variable_keys USING btree (name);



CREATE UNIQUE INDEX ix_clinical_variable_source_type_name ON clinical.variable_source_type USING btree (name);



CREATE INDEX ix_clinical_work_order_artifact_type_overrides_work_order_uuid ON clinical.work_order_artifact_type_overrides USING btree (work_order_uuid);



CREATE INDEX ix_clinical_work_order_variable_instance_versioned_asso_41a7 ON clinical.work_order_variable_instance_versioned_association USING btree (variable_instance_uuid);



CREATE INDEX ix_clinical_work_orders_patient_uuid ON clinical.work_orders USING btree (patient_uuid);



CREATE INDEX ix_variable_instance_versioned_etl_value ON clinical.variable_instances_versioned USING gin (etl_value jsonb_path_ops);



CREATE INDEX ix_variable_instance_versioned_user_value ON clinical.variable_instances_versioned USING gin (user_value jsonb_path_ops);



CREATE INDEX medical_codes_code_idx ON clinical.medical_codes USING btree (code);



CREATE INDEX medical_codes_ontology_uuid_code_idx ON clinical.medical_codes USING btree (ontology_uuid, code);



CREATE INDEX omop_concepts_concept_code_idx ON clinical.omop_concepts USING btree (concept_code);



CREATE INDEX variable_config_extractions_config_fhir_server_idx ON clinical.variable_config_extractions USING btree (variable_config_uuid, fhir_server_uuid);



ALTER TABLE ONLY clinical.artifact_references
    ADD CONSTRAINT artifact_ref_artifact_snapshot_transcript_uuid FOREIGN KEY (artifact_snapshot_transcript_uuid) REFERENCES clinical.artifact_snapshot_transcripts(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.artifact_references
    ADD CONSTRAINT artifact_ref_artifact_snapshot_uuid FOREIGN KEY (artifact_snapshot_uuid) REFERENCES clinical.artifact_snapshots(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.artifact_snapshot_attributes
    ADD CONSTRAINT artifact_snapshot_attributes_akc_fk FOREIGN KEY (attribute_key_configuration_uuid) REFERENCES clinical.attribute_key_configurations(uuid);



ALTER TABLE ONLY clinical.artifact_snapshot_previews
    ADD CONSTRAINT artifact_snapshot_previews_artifact_snapshot_uuid_fkey FOREIGN KEY (artifact_snapshot_uuid) REFERENCES clinical.artifact_snapshots(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.artifact_snapshot_transcripts
    ADD CONSTRAINT artifact_snapshot_transcripts_artifact_snapshot_uuid_fkey FOREIGN KEY (artifact_snapshot_uuid) REFERENCES clinical.artifact_snapshots(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.artifact_snapshots
    ADD CONSTRAINT artifact_snapshots_artifact_uuid_fkey FOREIGN KEY (artifact_uuid) REFERENCES clinical.artifacts(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.artifact_snapshots
    ADD CONSTRAINT artifact_snapshots_parent_artifact_snapshot_uuid_fkey FOREIGN KEY (parent_artifact_snapshot_uuid) REFERENCES clinical.artifact_snapshots(uuid);



ALTER TABLE ONLY clinical.artifact_type_configurations
    ADD CONSTRAINT artifact_type_configuration_artifact_uuid_fk FOREIGN KEY (artifact_type_uuid) REFERENCES clinical.artifact_types(uuid);



ALTER TABLE ONLY clinical.artifact_types
    ADD CONSTRAINT artifact_type_file_type_uuid_fk FOREIGN KEY (file_type_uuid) REFERENCES clinical.file_types(uuid);



ALTER TABLE ONLY clinical.artifacts
    ADD CONSTRAINT artifacts_patient_uuid_fkey FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.work_order_attribute_groups
    ADD CONSTRAINT attribute_group_type_configuration_uuid FOREIGN KEY (attribute_group_type_configuration_uuid) REFERENCES clinical.wot_configuration_attribute_group_type(uuid);



ALTER TABLE ONLY clinical.wot_configuration_attribute_group_type
    ADD CONSTRAINT attribute_group_type_uuid FOREIGN KEY (attribute_group_type_uuid) REFERENCES clinical.attribute_group_types(uuid);



ALTER TABLE ONLY clinical.attribute_key_configurations
    ADD CONSTRAINT attribute_group_type_uuid FOREIGN KEY (attribute_group_type_uuid) REFERENCES clinical.attribute_group_types(uuid);



ALTER TABLE ONLY clinical.work_order_attributes
    ADD CONSTRAINT attribute_group_uuid FOREIGN KEY (attribute_group_uuid) REFERENCES clinical.work_order_attribute_groups(uuid);



ALTER TABLE ONLY clinical.attribute_key_configurations
    ADD CONSTRAINT attribute_key_configuration_attribute_key FOREIGN KEY (attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.attribute_key_configurations
    ADD CONSTRAINT attribute_key_configurations_string_options_uuid FOREIGN KEY (string_options_uuid) REFERENCES clinical.string_options(uuid);



ALTER TABLE ONLY clinical.attribute_sources
    ADD CONSTRAINT attribute_sources_artifact_reference_fk FOREIGN KEY (artifact_reference_uuid) REFERENCES clinical.artifact_references(uuid);



ALTER TABLE ONLY clinical.wot_configuration_artifact_type
    ADD CONSTRAINT authored_date_attribute_key_uuid FOREIGN KEY (authored_date_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.biomarker_tests
    ADD CONSTRAINT biomarker_test_provider_uuid_fk FOREIGN KEY (biomarker_test_provider_uuid) REFERENCES clinical.biomarker_test_providers(uuid);



ALTER TABLE ONLY clinical.biomarker_tests_human_genes_association
    ADD CONSTRAINT biomarker_test_uuid_fk FOREIGN KEY (biomarker_test_uuid) REFERENCES clinical.biomarker_tests(uuid);



ALTER TABLE ONLY clinical.variable_keys
    ADD CONSTRAINT default_variable_unit_uuid FOREIGN KEY (default_variable_unit_uuid) REFERENCES clinical.variable_units(uuid);



ALTER TABLE ONLY clinical.artifact_snapshot_attributes
    ADD CONSTRAINT dss_attributes_artifact_snapshot_uuid FOREIGN KEY (artifact_snapshot_uuid) REFERENCES clinical.artifact_snapshots(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.study_versions
    ADD CONSTRAINT eligibility_variable_config_uuid FOREIGN KEY (eligibility_variable_config_uuid) REFERENCES clinical.variable_configs(uuid);



ALTER TABLE ONLY clinical.wot_configuration_attribute_group_type
    ADD CONSTRAINT entity_attribute_key_uuid FOREIGN KEY (entity_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.etl_appointment
    ADD CONSTRAINT etl_appointment_patient_uuid_fkey FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.etl_appointment
    ADD CONSTRAINT etl_appointment_practitioner_uuid_fkey FOREIGN KEY (practitioner_uuid) REFERENCES clinical.etl_patient_practitioner(uuid);



ALTER TABLE ONLY clinical.etl_events
    ADD CONSTRAINT etl_events_etl_run_uuid_fkey FOREIGN KEY (etl_run_uuid) REFERENCES clinical.etl_runs(uuid);



ALTER TABLE ONLY clinical.etl_patient_practitioner
    ADD CONSTRAINT etl_patient_practitioner_patient_uuid_fkey FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);




ALTER TABLE ONLY clinical.wot_configuration_artifact_type
    ADD CONSTRAINT event_date_attribute_key_uuid FOREIGN KEY (event_date_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.variable_config_extractions
    ADD CONSTRAINT fhir_server_uuid FOREIGN KEY (fhir_server_uuid) REFERENCES clinical.fhir_server(uuid);



ALTER TABLE ONLY clinical.site_fhir_server_association
    ADD CONSTRAINT fhir_server_uuid FOREIGN KEY (fhir_server_uuid) REFERENCES clinical.fhir_server(uuid);



ALTER TABLE ONLY clinical.variable_config_relationship_extractions
    ADD CONSTRAINT fhir_server_uuid FOREIGN KEY (fhir_server_uuid) REFERENCES clinical.fhir_server(uuid);



ALTER TABLE ONLY clinical.qc_rules
    ADD CONSTRAINT fhir_server_uuid FOREIGN KEY (fhir_server_uuid) REFERENCES clinical.fhir_server(uuid);



ALTER TABLE ONLY clinical.artifacts
    ADD CONSTRAINT file_attribute_key_configuration_artifact_type FOREIGN KEY (artifact_type_uuid) REFERENCES clinical.artifact_types(uuid);



ALTER TABLE ONLY clinical.attribute_key_configurations
    ADD CONSTRAINT file_attribute_key_configuration_artifact_type FOREIGN KEY (artifact_type_uuid) REFERENCES clinical.artifact_types(uuid);



ALTER TABLE ONLY clinical.attribute_key_configurations
    ADD CONSTRAINT file_attribute_key_configuration_file_type FOREIGN KEY (file_type_uuid) REFERENCES clinical.file_types(uuid);



ALTER TABLE ONLY clinical.biomarker_tests_human_genes_association
    ADD CONSTRAINT human_gene_uuid FOREIGN KEY (gene_uuid) REFERENCES clinical.human_genes(uuid);



ALTER TABLE ONLY clinical.issue_variable_instance_versioned_association
    ADD CONSTRAINT issue_uuid FOREIGN KEY (issue_uuid) REFERENCES clinical.issues(uuid);



ALTER TABLE ONLY clinical.medical_codes
    ADD CONSTRAINT medical_codes_ontology_uuid_fkey FOREIGN KEY (ontology_uuid) REFERENCES clinical.medical_code_ontologies(uuid);



ALTER TABLE ONLY clinical.omop_concepts
    ADD CONSTRAINT omop_concepts_ontology_uuid_fkey FOREIGN KEY (ontology_uuid) REFERENCES clinical.medical_code_ontologies(uuid);



ALTER TABLE ONLY clinical.variable_key_ontology_association
    ADD CONSTRAINT ontology_uuid FOREIGN KEY (ontology_uuid) REFERENCES clinical.medical_code_ontologies(uuid);



ALTER TABLE ONLY clinical.variable_config_source_contexts
    ADD CONSTRAINT other_variable_key_uuid FOREIGN KEY (other_variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.wot_configuration_attribute_group_type
    ADD CONSTRAINT parent_attribute_group_type_uuid FOREIGN KEY (parent_attribute_group_type_uuid) REFERENCES clinical.attribute_group_types(uuid);



ALTER TABLE ONLY clinical.work_order_attribute_groups
    ADD CONSTRAINT parent_attribute_group_uuid FOREIGN KEY (parent_attribute_group_uuid) REFERENCES clinical.work_order_attribute_groups(uuid);



ALTER TABLE ONLY clinical.patient_consent_status
    ADD CONSTRAINT patient_consent_event_uuid FOREIGN KEY (patient_consent_event_uuid) REFERENCES clinical.patient_consent_events(uuid);



ALTER TABLE ONLY clinical.patient_ids
    ADD CONSTRAINT patient_ids_fhir_server_uuid_fkey FOREIGN KEY (fhir_server_uuid) REFERENCES clinical.fhir_server(uuid);



ALTER TABLE ONLY clinical.etl_cancer_summary
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.etl_demographics
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.etl_runs
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.etl_timeline_event
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.variable_instances_versioned
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.patient_consent_status
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.patient_active_consent_documents
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.patient_consent_events
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.variable_instance_versioned_relationships_versioned
    ADD CONSTRAINT patient_uuid FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.qc_rule_eval_result_variable_instance_versioned_association
    ADD CONSTRAINT qc_rule_eval_result_uuid FOREIGN KEY (qc_rule_eval_result_uuid) REFERENCES clinical.qc_rule_eval_results(uuid);



ALTER TABLE ONLY clinical.qc_rule_eval_results
    ADD CONSTRAINT qc_rule_uuid FOREIGN KEY (qc_rule_uuid) REFERENCES clinical.qc_rules(uuid);



ALTER TABLE ONLY clinical.qc_rule_variable_config_association
    ADD CONSTRAINT qc_rule_uuid FOREIGN KEY (qc_rule_uuid) REFERENCES clinical.qc_rules(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT related_variable_key_uuid FOREIGN KEY (related_variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.site_organization_site_association
    ADD CONSTRAINT site_organization_uuid FOREIGN KEY (site_organization_uuid) REFERENCES clinical.site_organizations(uuid);



ALTER TABLE ONLY clinical.site_fhir_server_association
    ADD CONSTRAINT site_uuid FOREIGN KEY (site_uuid) REFERENCES clinical.sites(uuid);



ALTER TABLE ONLY clinical.site_organization_site_association
    ADD CONSTRAINT site_uuid FOREIGN KEY (site_uuid) REFERENCES clinical.sites(uuid);



ALTER TABLE ONLY clinical.site_study_association
    ADD CONSTRAINT site_uuid FOREIGN KEY (site_uuid) REFERENCES clinical.sites(uuid);



ALTER TABLE ONLY clinical.site_study_details
    ADD CONSTRAINT site_uuid FOREIGN KEY (site_uuid) REFERENCES clinical.sites(uuid);



ALTER TABLE ONLY clinical.study_consent_documents
    ADD CONSTRAINT site_uuid FOREIGN KEY (site_uuid) REFERENCES clinical.sites(uuid);



ALTER TABLE ONLY clinical.patient_active_consent_documents
    ADD CONSTRAINT study_consent_document_uuid FOREIGN KEY (study_consent_document_uuid) REFERENCES clinical.study_consent_documents(uuid);



ALTER TABLE ONLY clinical.patient_consent_events
    ADD CONSTRAINT study_consent_document_uuid FOREIGN KEY (study_consent_document_uuid) REFERENCES clinical.study_consent_documents(uuid);



ALTER TABLE ONLY clinical.study_consent_document_fields
    ADD CONSTRAINT study_consent_document_uuid FOREIGN KEY (study_consent_document_uuid) REFERENCES clinical.study_consent_documents(uuid);



ALTER TABLE ONLY clinical.study_consent_documents
    ADD CONSTRAINT study_consent_version_uuid FOREIGN KEY (study_consent_version_uuid) REFERENCES clinical.study_consent_versions(uuid);



ALTER TABLE ONLY clinical.site_study_association
    ADD CONSTRAINT study_uuid FOREIGN KEY (study_uuid) REFERENCES clinical.studies(uuid);



ALTER TABLE ONLY clinical.study_versions
    ADD CONSTRAINT study_uuid FOREIGN KEY (study_uuid) REFERENCES clinical.studies(uuid);



ALTER TABLE ONLY clinical.patient_consent_status
    ADD CONSTRAINT study_uuid FOREIGN KEY (study_uuid) REFERENCES clinical.studies(uuid);



ALTER TABLE ONLY clinical.study_relationships
    ADD CONSTRAINT study_uuid_from FOREIGN KEY (study_uuid_from) REFERENCES clinical.studies(uuid);



ALTER TABLE ONLY clinical.study_relationships
    ADD CONSTRAINT study_uuid_to FOREIGN KEY (study_uuid_to) REFERENCES clinical.studies(uuid);



ALTER TABLE ONLY clinical.site_study_details
    ADD CONSTRAINT study_version_uuid FOREIGN KEY (study_version_uuid) REFERENCES clinical.study_versions(uuid);



ALTER TABLE ONLY clinical.study_consent_versions
    ADD CONSTRAINT study_version_uuid FOREIGN KEY (study_version_uuid) REFERENCES clinical.study_versions(uuid);



ALTER TABLE ONLY clinical.sites
    ADD CONSTRAINT timezone_uuid FOREIGN KEY (timezone_uuid) REFERENCES clinical.timezones(uuid);



ALTER TABLE ONLY clinical.wot_configuration_attribute_group_type
    ADD CONSTRAINT user_confirmed_attribute_key_uuid FOREIGN KEY (user_confirmed_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.variable_instance_sources
    ADD CONSTRAINT uuid FOREIGN KEY (artifact_reference_uuid) REFERENCES clinical.artifact_references(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_attribute_group_type_uuid FOREIGN KEY (variable_attribute_group_type_uuid) REFERENCES clinical.attribute_group_types(uuid);



ALTER TABLE ONLY clinical.variable_config_relationship_extractions
    ADD CONSTRAINT variable_config_relationship_fk FOREIGN KEY (variable_config_relationship_uuid, variable_config_relationship_version_num) REFERENCES clinical.variable_config_relationships(uuid, version_num);




ALTER TABLE ONLY clinical.variable_config_extractions
    ADD CONSTRAINT variable_config_uuid FOREIGN KEY (variable_config_uuid) REFERENCES clinical.variable_configs(uuid);



ALTER TABLE ONLY clinical.variable_config_source_contexts
    ADD CONSTRAINT variable_config_uuid FOREIGN KEY (variable_config_uuid) REFERENCES clinical.variable_configs(uuid);



ALTER TABLE ONLY clinical.variable_instances_versioned
    ADD CONSTRAINT variable_config_uuid FOREIGN KEY (variable_config_uuid) REFERENCES clinical.variable_configs(uuid);



ALTER TABLE ONLY clinical.qc_rule_variable_config_association
    ADD CONSTRAINT variable_config_uuid FOREIGN KEY (variable_config_uuid) REFERENCES clinical.variable_configs(uuid);



ALTER TABLE ONLY clinical.variable_config_relationships
    ADD CONSTRAINT variable_config_uuid_from FOREIGN KEY (variable_config_uuid_from) REFERENCES clinical.variable_configs(uuid);



ALTER TABLE ONLY clinical.variable_config_relationships
    ADD CONSTRAINT variable_config_uuid_to FOREIGN KEY (variable_config_uuid_to) REFERENCES clinical.variable_configs(uuid);



ALTER TABLE ONLY clinical.variable_key_domain_association
    ADD CONSTRAINT variable_domain_uuid FOREIGN KEY (variable_domain_uuid) REFERENCES clinical.variable_domains(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_event_date_attribute_key_uuid FOREIGN KEY (variable_event_date_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.variable_instance_versioned_relationships_versioned
    ADD CONSTRAINT variable_instance_relationships_relationship_config FOREIGN KEY (relationship_config_uuid, relationship_config_version_num) REFERENCES clinical.variable_config_relationships(uuid, version_num);



ALTER TABLE ONLY clinical.variable_instance_versioned_relationships_versioned
    ADD CONSTRAINT variable_instance_relationships_variable_instance_from FOREIGN KEY (variable_instance_uuid_from, variable_instance_version_num_from) REFERENCES clinical.variable_instances_versioned(uuid, version_num);



ALTER TABLE ONLY clinical.variable_instance_versioned_relationships_versioned
    ADD CONSTRAINT variable_instance_relationships_variable_instance_to FOREIGN KEY (variable_instance_uuid_to, variable_instance_version_num_to) REFERENCES clinical.variable_instances_versioned(uuid, version_num);



ALTER TABLE ONLY clinical.variable_instance_sources
    ADD CONSTRAINT variable_instance_sources_variable_instance FOREIGN KEY (variable_instance_uuid, variable_instance_version_num) REFERENCES clinical.variable_instances_versioned(uuid, version_num);



ALTER TABLE ONLY clinical.work_order_variable_instance_versioned_association
    ADD CONSTRAINT variable_instance_uuid_variable_instance_version_num FOREIGN KEY (variable_instance_uuid, variable_instance_version_num) REFERENCES clinical.variable_instances_versioned(uuid, version_num);





ALTER TABLE ONLY clinical.variable_cdisc_mappings
    ADD CONSTRAINT variable_key_uuid FOREIGN KEY (variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.variable_configs
    ADD CONSTRAINT variable_key_uuid FOREIGN KEY (variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.variable_key_domain_association
    ADD CONSTRAINT variable_key_uuid FOREIGN KEY (variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.variable_key_unit_association
    ADD CONSTRAINT variable_key_uuid FOREIGN KEY (variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_key_uuid FOREIGN KEY (variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.variable_key_ontology_association
    ADD CONSTRAINT variable_key_uuid FOREIGN KEY (variable_key_uuid) REFERENCES clinical.variable_keys(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_ontology_attribute_key_uuid FOREIGN KEY (variable_ontology_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_source_type_attribute_key_uuid FOREIGN KEY (variable_source_type_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.variable_instance_sources
    ADD CONSTRAINT variable_source_type_uuid FOREIGN KEY (variable_source_type_uuid) REFERENCES clinical.variable_source_type(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_source_value_attribute_key_uuid FOREIGN KEY (variable_source_value_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_unit_attribute_key_uuid FOREIGN KEY (variable_unit_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.variable_key_unit_association
    ADD CONSTRAINT variable_unit_uuid FOREIGN KEY (variable_unit_uuid) REFERENCES clinical.variable_units(uuid);



ALTER TABLE ONLY clinical.issue_variable_instance_versioned_association
    ADD CONSTRAINT variable_uuid_version_num FOREIGN KEY (variable_instance_uuid, variable_version_num) REFERENCES clinical.variable_instances_versioned(uuid, version_num);



ALTER TABLE ONLY clinical.qc_rule_eval_result_variable_instance_versioned_association
    ADD CONSTRAINT variable_uuid_version_num FOREIGN KEY (variable_instance_uuid, variable_version_num) REFERENCES clinical.variable_instances_versioned(uuid, version_num);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_value_attribute_key_uuid FOREIGN KEY (variable_value_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT variable_value_unknown_attribute_key_uuid FOREIGN KEY (variable_value_unknown_attribute_key_uuid) REFERENCES clinical.attribute_keys(uuid);



ALTER TABLE ONLY clinical.work_order_artifact_association
    ADD CONSTRAINT work_order_artifact_association_artifact_uuid_fkey FOREIGN KEY (artifact_uuid) REFERENCES clinical.artifacts(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_artifact_association
    ADD CONSTRAINT work_order_artifact_association_work_order_uuid_fkey FOREIGN KEY (work_order_uuid) REFERENCES clinical.work_orders(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_artifact_type_overrides
    ADD CONSTRAINT work_order_artifact_type_overrides_artifact_type_uuid FOREIGN KEY (artifact_type_uuid) REFERENCES clinical.artifact_types(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_artifact_type_overrides
    ADD CONSTRAINT work_order_artifact_type_overrides_work_order_uuid FOREIGN KEY (work_order_uuid) REFERENCES clinical.work_orders(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_variable_instance_versioned_association
    ADD CONSTRAINT work_order_attribute_group_uuid FOREIGN KEY (work_order_attribute_group_uuid) REFERENCES clinical.work_order_attribute_groups(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_variable_instance_versioned_association
    ADD CONSTRAINT work_order_attribute_uuid FOREIGN KEY (work_order_attribute_uuid) REFERENCES clinical.work_order_attributes(attribute_uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_attributes
    ADD CONSTRAINT work_order_attributes_attribute_key_configuration_uuid FOREIGN KEY (attribute_key_configuration_uuid) REFERENCES clinical.attribute_key_configurations(uuid);



ALTER TABLE ONLY clinical.work_order_attributes
    ADD CONSTRAINT work_order_attributes_work_order_uuid FOREIGN KEY (work_order_uuid) REFERENCES clinical.work_orders(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_dependencies
    ADD CONSTRAINT work_order_dependencies_from_work_order_uuid FOREIGN KEY (from_work_order_uuid) REFERENCES clinical.work_orders(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_dependencies
    ADD CONSTRAINT work_order_dependencies_to_work_order_uuid FOREIGN KEY (to_work_order_uuid) REFERENCES clinical.work_orders(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.wot_configuration_artifact_type
    ADD CONSTRAINT work_order_type_configuration_artifact_type_work_order_type FOREIGN KEY (work_order_type_uuid) REFERENCES clinical.work_order_types(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.attribute_key_configurations
    ADD CONSTRAINT work_order_type_configuration_attribute_key_work_order_type FOREIGN KEY (work_order_type_uuid) REFERENCES clinical.work_order_types(uuid);



ALTER TABLE ONLY clinical.wot_configuration_next_work_orders
    ADD CONSTRAINT work_order_type_configuration_next_work_orders_next_wot FOREIGN KEY (next_work_order_type_uuid) REFERENCES clinical.work_order_types(uuid);



ALTER TABLE ONLY clinical.wot_configuration_next_work_orders
    ADD CONSTRAINT work_order_type_configuration_next_work_orders_prev_wot FOREIGN KEY (previous_work_order_type_uuid) REFERENCES clinical.work_order_types(uuid);



ALTER TABLE ONLY clinical.work_order_types
    ADD CONSTRAINT work_order_type_genric_type_fk FOREIGN KEY (generic_type_uuid) REFERENCES clinical.work_order_generic_types(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_types
    ADD CONSTRAINT work_order_type_group_fk FOREIGN KEY (group_uuid) REFERENCES clinical.work_order_type_groups(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.wot_configuration_variable_keys
    ADD CONSTRAINT work_order_type_uuid FOREIGN KEY (work_order_type_uuid) REFERENCES clinical.work_order_types(uuid);



ALTER TABLE ONLY clinical.wot_configuration_attribute_group_type
    ADD CONSTRAINT work_order_type_uuid FOREIGN KEY (work_order_type_uuid) REFERENCES clinical.work_order_types(uuid);



ALTER TABLE ONLY clinical.work_order_variable_instance_versioned_association
    ADD CONSTRAINT work_order_uuid FOREIGN KEY (work_order_uuid) REFERENCES clinical.work_orders(uuid) ON DELETE CASCADE;



ALTER TABLE ONLY clinical.work_order_attribute_groups
    ADD CONSTRAINT work_order_uuid FOREIGN KEY (work_order_uuid) REFERENCES clinical.work_orders(uuid);



ALTER TABLE ONLY clinical.work_order_attribute_group_type_configuration
    ADD CONSTRAINT work_order_uuid FOREIGN KEY (work_order_uuid) REFERENCES clinical.work_orders(uuid);



ALTER TABLE ONLY clinical.work_orders
    ADD CONSTRAINT work_orders_patient_uuid_fkey FOREIGN KEY (patient_uuid) REFERENCES clinical.patient_ids(uuid);



ALTER TABLE ONLY clinical.work_orders
    ADD CONSTRAINT work_orders_work_order_type_uuid FOREIGN KEY (work_order_type_uuid) REFERENCES clinical.work_order_types(uuid);



ALTER TABLE ONLY clinical.work_order_attribute_group_type_configuration
    ADD CONSTRAINT wot_configuration_attribute_group_type_uuid FOREIGN KEY (wot_configuration_attribute_group_type_uuid) REFERENCES clinical.wot_configuration_attribute_group_type(uuid);



ALTER TABLE ONLY clinical.wot_configuration_artifact_type
    ADD CONSTRAINT wotdstc_artifact_type_uuid_fkey FOREIGN KEY (artifact_type_uuid) REFERENCES clinical.artifact_types(uuid) ON DELETE CASCADE;

