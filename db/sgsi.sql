--
-- PostgreSQL database dump
--

\restrict DN7Boo3Eke5U2fepf6BcmS3W7C25VQbK4eCuyxuGuaL9Pbbn7pBPs9F6QWCiUrn

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: sgsi; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE sgsi IS 'Base de datos para proyecto de tesis sobre:
"Sistema de Gestion de la Seguridad de la Informacion"';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: month(date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION month(date) RETURNS integer
    LANGUAGE sql IMMUTABLE
    AS $_$
      SELECT EXTRACT(MONTH FROM $1)::INTEGER;
$_$;


SET default_tablespace = '';

--
-- Name: accion_asoaciada_control; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE accion_asoaciada_control (
    idaccion_asociada_control integer NOT NULL,
    idempleado integer NOT NULL,
    nombre character varying(100),
    recursos character varying(100),
    plazo timestamp with time zone,
    idplan_tratamiento integer NOT NULL
);


--
-- Name: accion_asoaciada_control_idaccion_asociada_control_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accion_asoaciada_control_idaccion_asociada_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accion_asoaciada_control_idaccion_asociada_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accion_asoaciada_control_idaccion_asociada_control_seq OWNED BY accion_asoaciada_control.idaccion_asociada_control;


--
-- Name: acta_reunion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE acta_reunion (
    idacta_reunion integer NOT NULL,
    idtipo_acta_reunion integer NOT NULL,
    asunto character varying(200) NOT NULL,
    duracion character varying(10),
    lugar character varying(40),
    descripcion text,
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: acta_reunion_idacta_reunion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE acta_reunion_idacta_reunion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acta_reunion_idacta_reunion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE acta_reunion_idacta_reunion_seq OWNED BY acta_reunion.idacta_reunion;


--
-- Name: activo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activo (
    idactivo integer NOT NULL,
    activo character varying(200) NOT NULL,
    uds integer DEFAULT 0 NOT NULL,
    idactivo_categoria integer,
    propietario character varying(200),
    idactivo_confidencialidad integer,
    idactivo_integridad integer,
    idactivo_disponibilidad integer,
    idactivo_importancia integer,
    ubicacion_fisica character varying(200),
    version character varying(50),
    descripcion text,
    marca_modelo character varying(100),
    fuente_distribuidor character varying(100),
    idempresa integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: TABLE activo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE activo IS 'Tabla contenedora de todos los activos.';


--
-- Name: activo_categoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activo_categoria (
    idactivo_categoria integer NOT NULL,
    detalle character varying(100)
);


--
-- Name: activo_categoria_idactivo_categoria_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activo_categoria_idactivo_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activo_categoria_idactivo_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activo_categoria_idactivo_categoria_seq OWNED BY activo_categoria.idactivo_categoria;


--
-- Name: activo_confidencialidad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activo_confidencialidad (
    idactivo_confidencialidad integer NOT NULL,
    detalle character varying(100) NOT NULL,
    color character varying(30)
);


--
-- Name: activo_confidencialidad_idactivo_confidencialidad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activo_confidencialidad_idactivo_confidencialidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activo_confidencialidad_idactivo_confidencialidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activo_confidencialidad_idactivo_confidencialidad_seq OWNED BY activo_confidencialidad.idactivo_confidencialidad;


--
-- Name: activo_disponibilidad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activo_disponibilidad (
    idactivo_disponibilidad integer NOT NULL,
    detalle character varying(100),
    color character varying(30)
);


--
-- Name: activo_disponibilidad_idactivo_disponibilidad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activo_disponibilidad_idactivo_disponibilidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activo_disponibilidad_idactivo_disponibilidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activo_disponibilidad_idactivo_disponibilidad_seq OWNED BY activo_disponibilidad.idactivo_disponibilidad;


--
-- Name: activo_idactivo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activo_idactivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activo_idactivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activo_idactivo_seq OWNED BY activo.idactivo;


--
-- Name: activo_importancia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activo_importancia (
    idactivo_importancia integer NOT NULL,
    detalle character varying(100) NOT NULL,
    color character varying(30)
);


--
-- Name: activo_importancia_idactivo_importancia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activo_importancia_idactivo_importancia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activo_importancia_idactivo_importancia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activo_importancia_idactivo_importancia_seq OWNED BY activo_importancia.idactivo_importancia;


--
-- Name: activo_integridad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activo_integridad (
    idactivo_integridad integer NOT NULL,
    detalle character varying(100) NOT NULL,
    color character varying(30)
);


--
-- Name: activo_integridad_idactivo_integridad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activo_integridad_idactivo_integridad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activo_integridad_idactivo_integridad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activo_integridad_idactivo_integridad_seq OWNED BY activo_integridad.idactivo_integridad;


--
-- Name: amenaza; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE amenaza (
    idamenaza integer NOT NULL,
    idactivo integer,
    amenaza character varying(200),
    vulnerabilidad character varying(200),
    comentario text,
    idamenaza_impacto integer,
    idamenaza_importancia integer,
    idamenaza_probabilidad integer,
    idamenaza_riesgo integer,
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: TABLE amenaza; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE amenaza IS 'Amenazas registradas para los activos de la empresa';


--
-- Name: amenaza_idamenaza_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amenaza_idamenaza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenaza_idamenaza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amenaza_idamenaza_seq OWNED BY amenaza.idamenaza;


--
-- Name: amenaza_impacto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE amenaza_impacto (
    idamenaza_impacto integer NOT NULL,
    detalle character varying(100),
    color character varying(30) NOT NULL
);


--
-- Name: amenaza_impacto_idamenaza_impacto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amenaza_impacto_idamenaza_impacto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenaza_impacto_idamenaza_impacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amenaza_impacto_idamenaza_impacto_seq OWNED BY amenaza_impacto.idamenaza_impacto;


--
-- Name: amenaza_importancia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE amenaza_importancia (
    idamenaza_importancia integer NOT NULL,
    detalle character varying(100),
    color character varying(30) NOT NULL
);


--
-- Name: amenaza_importancia_idamenaza_importancia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amenaza_importancia_idamenaza_importancia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenaza_importancia_idamenaza_importancia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amenaza_importancia_idamenaza_importancia_seq OWNED BY amenaza_importancia.idamenaza_importancia;


--
-- Name: amenaza_probabilidad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE amenaza_probabilidad (
    idamenaza_probabilidad integer NOT NULL,
    detalle character varying(100),
    color character varying(30) NOT NULL
);


--
-- Name: amenaza_propabilidad_idamenaza_propabilidad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amenaza_propabilidad_idamenaza_propabilidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenaza_propabilidad_idamenaza_propabilidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amenaza_propabilidad_idamenaza_propabilidad_seq OWNED BY amenaza_probabilidad.idamenaza_probabilidad;


--
-- Name: amenaza_riesgo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE amenaza_riesgo (
    idamenaza_riesgo integer NOT NULL,
    detalle character varying(100),
    color character varying(30) NOT NULL
);


--
-- Name: amenaza_riesgo_idamenaza_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amenaza_riesgo_idamenaza_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenaza_riesgo_idamenaza_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amenaza_riesgo_idamenaza_riesgo_seq OWNED BY amenaza_riesgo.idamenaza_riesgo;


--
-- Name: amenazas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE amenazas (
    idamenazas integer NOT NULL,
    codigo character varying(10) NOT NULL,
    detalle character varying(200),
    idactivo_categoria integer
);


--
-- Name: TABLE amenazas; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE amenazas IS 'Data de amenazas para ser reutilizada en cualquier parte del sistema donde sea requerida.';


--
-- Name: amenazas_idamenazas_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amenazas_idamenazas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenazas_idamenazas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amenazas_idamenazas_seq OWNED BY amenazas.idamenazas;


--
-- Name: area; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE area (
    idarea integer NOT NULL,
    iddepartamento integer NOT NULL,
    nombre character varying(40)
);


--
-- Name: area_idarea_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE area_idarea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: area_idarea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE area_idarea_seq OWNED BY area.idarea;


--
-- Name: asistentes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE asistentes (
    idempleado integer NOT NULL,
    idacta_reunion integer NOT NULL,
    responsable_acta boolean DEFAULT false NOT NULL
);


--
-- Name: asuntos_pendientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE asuntos_pendientes (
    idasuntos_pendientes integer NOT NULL,
    idacta_reunion integer NOT NULL,
    accion character varying(100) NOT NULL,
    idempleado integer NOT NULL,
    plazo character varying(50)
);


--
-- Name: asuntos_pendientes_idasuntos_pendientes_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE asuntos_pendientes_idasuntos_pendientes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: asuntos_pendientes_idasuntos_pendientes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE asuntos_pendientes_idasuntos_pendientes_seq OWNED BY asuntos_pendientes.idasuntos_pendientes;


--
-- Name: cargo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cargo (
    idcargo integer NOT NULL,
    idarea integer NOT NULL,
    nombre character varying(40)
);


--
-- Name: cargo_idcargo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cargo_idcargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cargo_idcargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cargo_idcargo_seq OWNED BY cargo.idcargo;


--
-- Name: gap; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gap (
    id integer NOT NULL,
    id_padre integer,
    detalle character varying(200) NOT NULL,
    indice character varying(20),
    estado smallint DEFAULT 0 NOT NULL,
    observacion text,
    aplica smallint DEFAULT 0 NOT NULL,
    control boolean DEFAULT false NOT NULL
);


--
-- Name: cobit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cobit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cobit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cobit_id_seq OWNED BY gap.id;


--
-- Name: comite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comite (
    idinicio_alcance integer NOT NULL,
    idcargo integer NOT NULL
);


--
-- Name: competencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE competencia (
    idcompetencia integer NOT NULL,
    idcargo integer NOT NULL,
    detalle character varying(150)
);


--
-- Name: competencia_idcompetencia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE competencia_idcompetencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: competencia_idcompetencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE competencia_idcompetencia_seq OWNED BY competencia.idcompetencia;


--
-- Name: conclusiones_acta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE conclusiones_acta (
    idconclusiones_acta integer NOT NULL,
    idacta_reunion integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


--
-- Name: conclusiones_acta_idconclusiones_acta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE conclusiones_acta_idconclusiones_acta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conclusiones_acta_idconclusiones_acta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE conclusiones_acta_idconclusiones_acta_seq OWNED BY conclusiones_acta.idconclusiones_acta;


--
-- Name: contacto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contacto (
    idcontacto integer NOT NULL,
    idsuministrador integer NOT NULL,
    nombre character varying(150) NOT NULL,
    cargo character varying(100) NOT NULL,
    telefono character varying(10),
    email character varying(100),
    comentario text
);


--
-- Name: contacto_idcontacto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contacto_idcontacto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contacto_idcontacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contacto_idcontacto_seq OWNED BY contacto.idcontacto;


--
-- Name: contrato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contrato (
    idcontrato integer NOT NULL,
    idsuministrador integer NOT NULL,
    detalle character varying(150) NOT NULL,
    inicio timestamp with time zone,
    fin timestamp with time zone,
    soporte text
);


--
-- Name: contrato_idcontrato_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contrato_idcontrato_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contrato_idcontrato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contrato_idcontrato_seq OWNED BY contrato.idcontrato;


--
-- Name: control; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE control (
    idcontrol integer NOT NULL,
    idamenaza integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    plazos integer DEFAULT 0,
    "fechaInicio" timestamp(6) with time zone,
    "fechaFin" timestamp(6) with time zone,
    costo money DEFAULT 0.00 NOT NULL,
    idempleado integer,
    control character varying(200)
);


--
-- Name: control_idcontrol_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE control_idcontrol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: control_idcontrol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE control_idcontrol_seq OWNED BY control.idcontrol;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE departamento (
    iddepartamento integer NOT NULL,
    idsucursal integer NOT NULL,
    nombre character varying(50) NOT NULL
);


--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE departamento_iddepartamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE departamento_iddepartamento_seq OWNED BY departamento.iddepartamento;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE departamentos (
    idinicio_alcance integer NOT NULL,
    iddepartamento integer NOT NULL
);


--
-- Name: diagrama; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE diagrama (
    iddiagrama integer NOT NULL,
    extension character varying(5),
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    archivo character varying(150),
    descripcion text,
    idacta_reunion integer NOT NULL,
    peso numeric(10,4)
);


--
-- Name: diagrama_iddiagrama_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE diagrama_iddiagrama_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diagrama_iddiagrama_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE diagrama_iddiagrama_seq OWNED BY diagrama.iddiagrama;


--
-- Name: documentacion_acta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documentacion_acta (
    iddocumentacion_acta integer NOT NULL,
    idacta_reunion integer NOT NULL,
    nombre character varying(100) NOT NULL,
    entrego character varying(50),
    referencia character varying(50)
);


--
-- Name: documentacion_acta_iddocumentacion_acta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documentacion_acta_iddocumentacion_acta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documentacion_acta_iddocumentacion_acta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documentacion_acta_iddocumentacion_acta_seq OWNED BY documentacion_acta.iddocumentacion_acta;


--
-- Name: empleado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empleado (
    idempleado integer NOT NULL,
    idcargo integer,
    nombres character varying(100) NOT NULL,
    apellidos character varying(100) NOT NULL,
    dni character varying(8) NOT NULL,
    idempresa integer
);


--
-- Name: empleado_idempleado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empleado_idempleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: empleado_idempleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empleado_idempleado_seq OWNED BY empleado.idempleado;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresa (
    idempresa integer NOT NULL,
    nombre character varying(200) NOT NULL,
    ruc character varying(11) NOT NULL,
    detalle text,
    "fechaRegistro" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: empresa_idempresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresa_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: empresa_idempresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresa_idempresa_seq OWNED BY empresa.idempresa;


--
-- Name: gap_bitacora; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gap_bitacora (
    idgap_bitacora integer NOT NULL,
    idgap integer NOT NULL,
    anterior character varying(100),
    actual character varying,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    campo character varying(100)
);


--
-- Name: gap_bitacora_idgap_bitacora_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gap_bitacora_idgap_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gap_bitacora_idgap_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gap_bitacora_idgap_bitacora_seq OWNED BY gap_bitacora.idgap_bitacora;


--
-- Name: indicador_asociado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE indicador_asociado (
    idindicador_asociado integer NOT NULL,
    detalle character varying(100)
);


--
-- Name: indicador_asociado_idindicador_asociado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE indicador_asociado_idindicador_asociado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: indicador_asociado_idindicador_asociado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE indicador_asociado_idindicador_asociado_seq OWNED BY indicador_asociado.idindicador_asociado;


--
-- Name: indicadores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE indicadores (
    idindicador integer NOT NULL,
    detalle character varying(100) NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    idempresa integer
);


--
-- Name: indicadore_idindicador_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE indicadore_idindicador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: indicadore_idindicador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE indicadore_idindicador_seq OWNED BY indicadores.idindicador;


--
-- Name: inicio_alcance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE inicio_alcance (
    idacta_reunion integer NOT NULL,
    nombre character varying(100),
    alcance character varying(100),
    descripcion text,
    idsg integer,
    exclusion character varying(150),
    ubicacion_organigrama character varying(200),
    ubicacion_diagrama character varying(200)
);


--
-- Name: interfaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE interfaces (
    idinicio_alcance integer NOT NULL,
    idcargo integer NOT NULL
);


--
-- Name: localizacion_fisica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE localizacion_fisica (
    idinicio_alcance integer NOT NULL,
    idarea integer NOT NULL
);


--
-- Name: objetivo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE objetivo (
    idobjetivo integer NOT NULL,
    idacta_reunion integer NOT NULL,
    objetivo character varying(200),
    descripcion text,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    idempleado integer
);


--
-- Name: objetivo_area_afectada; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE objetivo_area_afectada (
    idobjetivo integer NOT NULL,
    idarea integer NOT NULL
);


--
-- Name: objetivo_documentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE objetivo_documentos (
    idobjetivo_documentos integer NOT NULL,
    idobjetivo integer NOT NULL,
    documento character varying(200),
    extension character varying(4),
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    descripcion text,
    peso numeric(10,4)
);


--
-- Name: objetivo_documentos_idobjetivo_documentos_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE objetivo_documentos_idobjetivo_documentos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: objetivo_documentos_idobjetivo_documentos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE objetivo_documentos_idobjetivo_documentos_seq OWNED BY objetivo_documentos.idobjetivo_documentos;


--
-- Name: objetivo_especifico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE objetivo_especifico (
    idobjetivo_especifico integer NOT NULL,
    idobjetivo integer NOT NULL,
    descripcion text,
    idempleado integer,
    recursos text,
    nombre character varying(200)
);


--
-- Name: objetivo_especifico_idobjetivo_especifico_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE objetivo_especifico_idobjetivo_especifico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: objetivo_especifico_idobjetivo_especifico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE objetivo_especifico_idobjetivo_especifico_seq OWNED BY objetivo_especifico.idobjetivo_especifico;


--
-- Name: objetivo_idobjetivo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE objetivo_idobjetivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: objetivo_idobjetivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE objetivo_idobjetivo_seq OWNED BY objetivo.idobjetivo;


--
-- Name: obligacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE obligacion (
    idobligacion integer NOT NULL,
    idcargo integer NOT NULL,
    detalle character varying(150)
);


--
-- Name: obligacion_idobligacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE obligacion_idobligacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: obligacion_idobligacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE obligacion_idobligacion_seq OWNED BY obligacion.idobligacion;


--
-- Name: organigrama; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organigrama (
    idorganigrama integer NOT NULL,
    extension character varying(5),
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    archivo character varying(150),
    descripcion text,
    idacta_reunion integer NOT NULL,
    peso numeric(10,4)
);


--
-- Name: organigrama_idorganigrama_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organigrama_idorganigrama_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organigrama_idorganigrama_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organigrama_idorganigrama_seq OWNED BY organigrama.idorganigrama;


--
-- Name: plan_tratamiento_acciones_asociadas_control; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plan_tratamiento_acciones_asociadas_control (
    idacciones_asociadas_control integer NOT NULL,
    nombre character varying(150),
    idempleado integer,
    recursos text,
    plazo timestamp(6) with time zone DEFAULT now(),
    idplan_tratamiento integer
);


--
-- Name: COLUMN plan_tratamiento_acciones_asociadas_control.idempleado; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN plan_tratamiento_acciones_asociadas_control.idempleado IS 'RESPONSABLE';


--
-- Name: plan_seguimiento_acciones_asoc_idacciones_asociadas_control_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE plan_seguimiento_acciones_asoc_idacciones_asociadas_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plan_seguimiento_acciones_asoc_idacciones_asociadas_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE plan_seguimiento_acciones_asoc_idacciones_asociadas_control_seq OWNED BY plan_tratamiento_acciones_asociadas_control.idacciones_asociadas_control;


--
-- Name: plan_tratamiento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plan_tratamiento (
    idplan_tratamiento integer NOT NULL,
    nombres character varying(100),
    "controlSOA" text,
    idempleado integer,
    recursos text,
    plazo timestamp with time zone,
    coste money,
    observaciones text
);


--
-- Name: COLUMN plan_tratamiento.idempleado; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN plan_tratamiento.idempleado IS 'Responsable';


--
-- Name: plan_tratamiento_activos_repercutidos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plan_tratamiento_activos_repercutidos (
    idplan_tratamiento integer NOT NULL,
    idactivo integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: plan_tratamiento_asociacion_amenazas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plan_tratamiento_asociacion_amenazas (
    idplan_tratamiento integer NOT NULL,
    idamenaza integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: plan_tratamiento_control; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plan_tratamiento_control (
    idplan_tratamiento integer NOT NULL,
    idgap integer NOT NULL,
    fecha timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: plan_tratamiento_idplan_tratamiento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE plan_tratamiento_idplan_tratamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plan_tratamiento_idplan_tratamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE plan_tratamiento_idplan_tratamiento_seq OWNED BY plan_tratamiento.idplan_tratamiento;


--
-- Name: plan_tratamiento_indicadores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plan_tratamiento_indicadores (
    idplan_tratamiento integer NOT NULL,
    idindicador integer NOT NULL
);


--
-- Name: proyecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE proyecto (
    idproyecto integer NOT NULL,
    idgap integer NOT NULL,
    tarea character varying(200) NOT NULL,
    completada boolean DEFAULT false NOT NULL,
    descripcion text NOT NULL,
    inicio date,
    fin date
);


--
-- Name: proyecto_idproyecto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proyecto_idproyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proyecto_idproyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proyecto_idproyecto_seq OWNED BY proyecto.idproyecto;


--
-- Name: puntos_tratados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE puntos_tratados (
    idpuntos_tratados integer NOT NULL,
    idacta_reunion integer NOT NULL,
    actividad character varying(100) NOT NULL,
    descripcion text
);


--
-- Name: puntos_tratados_idpuntos_tratados_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE puntos_tratados_idpuntos_tratados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: puntos_tratados_idpuntos_tratados_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE puntos_tratados_idpuntos_tratados_seq OWNED BY puntos_tratados.idpuntos_tratados;


--
-- Name: responsables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE responsables (
    idinicio_alcance integer NOT NULL,
    idempleado integer NOT NULL
);


--
-- Name: seguimiento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE seguimiento (
    idseguimiento integer NOT NULL,
    idsuministrador integer NOT NULL,
    usuario character varying(150) NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    descripcion text
);


--
-- Name: seguimiento_idseguimiento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seguimiento_idseguimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seguimiento_idseguimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE seguimiento_idseguimiento_seq OWNED BY seguimiento.idseguimiento;


--
-- Name: sg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sg (
    idsg integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- Name: sg_idsg_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sg_idsg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sg_idsg_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sg_idsg_seq OWNED BY sg.idsg;


--
-- Name: sla; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sla (
    idsla integer NOT NULL,
    idsuministrador integer NOT NULL,
    descripcion text,
    nombre character varying(100)
);


--
-- Name: sla_idsla_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sla_idsla_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sla_idsla_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sla_idsla_seq OWNED BY sla.idsla;


--
-- Name: sucursal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sucursal (
    idsucursal integer NOT NULL,
    idempresa integer NOT NULL,
    nombre character varying(200),
    departamento character varying(30),
    ciudad character varying(30),
    direccion character varying(100)
);


--
-- Name: sucursal_idsucursal_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sucursal_idsucursal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sucursal_idsucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sucursal_idsucursal_seq OWNED BY sucursal.idsucursal;


--
-- Name: suministrador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE suministrador (
    idsuministrador integer NOT NULL,
    idempresa integer,
    "RUC" character varying(11),
    razon_social character varying(200) NOT NULL,
    descripcion text,
    idempleado integer,
    direccion character varying(150),
    poblacion integer,
    provincia character varying(40),
    pais character varying(40),
    comentario text,
    idindicador_asociado integer,
    estado boolean DEFAULT false NOT NULL
);


--
-- Name: suministrador_idsuministradores_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suministrador_idsuministradores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suministrador_idsuministradores_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE suministrador_idsuministradores_seq OWNED BY suministrador.idsuministrador;


--
-- Name: tarea; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tarea (
    idtarea integer NOT NULL,
    idgap integer NOT NULL,
    detalle character varying(150) NOT NULL,
    inicio date,
    fin date,
    completado boolean DEFAULT false NOT NULL,
    descripcion text
);


--
-- Name: tarea_docconsultora; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tarea_docconsultora (
    idtarea_docconsultora integer NOT NULL,
    idtarea integer NOT NULL,
    documento text NOT NULL,
    fecha timestamp with time zone DEFAULT now()
);


--
-- Name: tarea_docconsultora_idtarea_docconsultora_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tarea_docconsultora_idtarea_docconsultora_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tarea_docconsultora_idtarea_docconsultora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tarea_docconsultora_idtarea_docconsultora_seq OWNED BY tarea_docconsultora.idtarea_docconsultora;


--
-- Name: tarea_docempresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tarea_docempresa (
    idtarea_docempresa integer NOT NULL,
    idtarea integer NOT NULL,
    documento text,
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: tarea_docempresa_idtarea_docempresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tarea_docempresa_idtarea_docempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tarea_docempresa_idtarea_docempresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tarea_docempresa_idtarea_docempresa_seq OWNED BY tarea_docempresa.idtarea_docempresa;


--
-- Name: tarea_idtarea_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tarea_idtarea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tarea_idtarea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tarea_idtarea_seq OWNED BY tarea.idtarea;


--
-- Name: tarea_responsable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tarea_responsable (
    idtarea integer NOT NULL,
    idempleado integer NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: tipo_acta_reunion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_acta_reunion (
    idtipo_acta_reunion integer NOT NULL,
    nombre character varying(30) NOT NULL
);


--
-- Name: tipo_acta_reunion_idtipo_acta_reunion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_acta_reunion_idtipo_acta_reunion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipo_acta_reunion_idtipo_acta_reunion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_acta_reunion_idtipo_acta_reunion_seq OWNED BY tipo_acta_reunion.idtipo_acta_reunion;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usuario (
    idusuario integer NOT NULL,
    usuario character varying(8) NOT NULL,
    clave character varying(32) NOT NULL,
    activo boolean DEFAULT false NOT NULL,
    idempresa integer NOT NULL
);


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuario_idusuario_seq OWNED BY usuario.idusuario;


--
-- Name: idaccion_asociada_control; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY accion_asoaciada_control ALTER COLUMN idaccion_asociada_control SET DEFAULT nextval('accion_asoaciada_control_idaccion_asociada_control_seq'::regclass);


--
-- Name: idacta_reunion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY acta_reunion ALTER COLUMN idacta_reunion SET DEFAULT nextval('acta_reunion_idacta_reunion_seq'::regclass);


--
-- Name: idactivo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo ALTER COLUMN idactivo SET DEFAULT nextval('activo_idactivo_seq'::regclass);


--
-- Name: idactivo_categoria; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_categoria ALTER COLUMN idactivo_categoria SET DEFAULT nextval('activo_categoria_idactivo_categoria_seq'::regclass);


--
-- Name: idactivo_confidencialidad; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_confidencialidad ALTER COLUMN idactivo_confidencialidad SET DEFAULT nextval('activo_confidencialidad_idactivo_confidencialidad_seq'::regclass);


--
-- Name: idactivo_disponibilidad; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_disponibilidad ALTER COLUMN idactivo_disponibilidad SET DEFAULT nextval('activo_disponibilidad_idactivo_disponibilidad_seq'::regclass);


--
-- Name: idactivo_importancia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_importancia ALTER COLUMN idactivo_importancia SET DEFAULT nextval('activo_importancia_idactivo_importancia_seq'::regclass);


--
-- Name: idactivo_integridad; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_integridad ALTER COLUMN idactivo_integridad SET DEFAULT nextval('activo_integridad_idactivo_integridad_seq'::regclass);


--
-- Name: idamenaza; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza ALTER COLUMN idamenaza SET DEFAULT nextval('amenaza_idamenaza_seq'::regclass);


--
-- Name: idamenaza_impacto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_impacto ALTER COLUMN idamenaza_impacto SET DEFAULT nextval('amenaza_impacto_idamenaza_impacto_seq'::regclass);


--
-- Name: idamenaza_importancia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_importancia ALTER COLUMN idamenaza_importancia SET DEFAULT nextval('amenaza_importancia_idamenaza_importancia_seq'::regclass);


--
-- Name: idamenaza_probabilidad; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_probabilidad ALTER COLUMN idamenaza_probabilidad SET DEFAULT nextval('amenaza_propabilidad_idamenaza_propabilidad_seq'::regclass);


--
-- Name: idamenaza_riesgo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_riesgo ALTER COLUMN idamenaza_riesgo SET DEFAULT nextval('amenaza_riesgo_idamenaza_riesgo_seq'::regclass);


--
-- Name: idamenazas; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenazas ALTER COLUMN idamenazas SET DEFAULT nextval('amenazas_idamenazas_seq'::regclass);


--
-- Name: idarea; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY area ALTER COLUMN idarea SET DEFAULT nextval('area_idarea_seq'::regclass);


--
-- Name: idasuntos_pendientes; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY asuntos_pendientes ALTER COLUMN idasuntos_pendientes SET DEFAULT nextval('asuntos_pendientes_idasuntos_pendientes_seq'::regclass);


--
-- Name: idcargo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargo ALTER COLUMN idcargo SET DEFAULT nextval('cargo_idcargo_seq'::regclass);


--
-- Name: idcompetencia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY competencia ALTER COLUMN idcompetencia SET DEFAULT nextval('competencia_idcompetencia_seq'::regclass);


--
-- Name: idconclusiones_acta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY conclusiones_acta ALTER COLUMN idconclusiones_acta SET DEFAULT nextval('conclusiones_acta_idconclusiones_acta_seq'::regclass);


--
-- Name: idcontacto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacto ALTER COLUMN idcontacto SET DEFAULT nextval('contacto_idcontacto_seq'::regclass);


--
-- Name: idcontrato; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contrato ALTER COLUMN idcontrato SET DEFAULT nextval('contrato_idcontrato_seq'::regclass);


--
-- Name: idcontrol; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY control ALTER COLUMN idcontrol SET DEFAULT nextval('control_idcontrol_seq'::regclass);


--
-- Name: iddepartamento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamento ALTER COLUMN iddepartamento SET DEFAULT nextval('departamento_iddepartamento_seq'::regclass);


--
-- Name: iddiagrama; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY diagrama ALTER COLUMN iddiagrama SET DEFAULT nextval('diagrama_iddiagrama_seq'::regclass);


--
-- Name: iddocumentacion_acta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentacion_acta ALTER COLUMN iddocumentacion_acta SET DEFAULT nextval('documentacion_acta_iddocumentacion_acta_seq'::regclass);


--
-- Name: idempleado; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empleado ALTER COLUMN idempleado SET DEFAULT nextval('empleado_idempleado_seq'::regclass);


--
-- Name: idempresa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa ALTER COLUMN idempresa SET DEFAULT nextval('empresa_idempresa_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gap ALTER COLUMN id SET DEFAULT nextval('cobit_id_seq'::regclass);


--
-- Name: idgap_bitacora; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gap_bitacora ALTER COLUMN idgap_bitacora SET DEFAULT nextval('gap_bitacora_idgap_bitacora_seq'::regclass);


--
-- Name: idindicador_asociado; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicador_asociado ALTER COLUMN idindicador_asociado SET DEFAULT nextval('indicador_asociado_idindicador_asociado_seq'::regclass);


--
-- Name: idindicador; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicadores ALTER COLUMN idindicador SET DEFAULT nextval('indicadore_idindicador_seq'::regclass);


--
-- Name: idobjetivo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo ALTER COLUMN idobjetivo SET DEFAULT nextval('objetivo_idobjetivo_seq'::regclass);


--
-- Name: idobjetivo_documentos; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_documentos ALTER COLUMN idobjetivo_documentos SET DEFAULT nextval('objetivo_documentos_idobjetivo_documentos_seq'::regclass);


--
-- Name: idobjetivo_especifico; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_especifico ALTER COLUMN idobjetivo_especifico SET DEFAULT nextval('objetivo_especifico_idobjetivo_especifico_seq'::regclass);


--
-- Name: idobligacion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY obligacion ALTER COLUMN idobligacion SET DEFAULT nextval('obligacion_idobligacion_seq'::regclass);


--
-- Name: idorganigrama; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organigrama ALTER COLUMN idorganigrama SET DEFAULT nextval('organigrama_idorganigrama_seq'::regclass);


--
-- Name: idplan_tratamiento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento ALTER COLUMN idplan_tratamiento SET DEFAULT nextval('plan_tratamiento_idplan_tratamiento_seq'::regclass);


--
-- Name: idacciones_asociadas_control; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_acciones_asociadas_control ALTER COLUMN idacciones_asociadas_control SET DEFAULT nextval('plan_seguimiento_acciones_asoc_idacciones_asociadas_control_seq'::regclass);


--
-- Name: idproyecto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyecto ALTER COLUMN idproyecto SET DEFAULT nextval('proyecto_idproyecto_seq'::regclass);


--
-- Name: idpuntos_tratados; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY puntos_tratados ALTER COLUMN idpuntos_tratados SET DEFAULT nextval('puntos_tratados_idpuntos_tratados_seq'::regclass);


--
-- Name: idseguimiento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY seguimiento ALTER COLUMN idseguimiento SET DEFAULT nextval('seguimiento_idseguimiento_seq'::regclass);


--
-- Name: idsg; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sg ALTER COLUMN idsg SET DEFAULT nextval('sg_idsg_seq'::regclass);


--
-- Name: idsla; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sla ALTER COLUMN idsla SET DEFAULT nextval('sla_idsla_seq'::regclass);


--
-- Name: idsucursal; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sucursal ALTER COLUMN idsucursal SET DEFAULT nextval('sucursal_idsucursal_seq'::regclass);


--
-- Name: idsuministrador; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY suministrador ALTER COLUMN idsuministrador SET DEFAULT nextval('suministrador_idsuministradores_seq'::regclass);


--
-- Name: idtarea; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea ALTER COLUMN idtarea SET DEFAULT nextval('tarea_idtarea_seq'::regclass);


--
-- Name: idtarea_docconsultora; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_docconsultora ALTER COLUMN idtarea_docconsultora SET DEFAULT nextval('tarea_docconsultora_idtarea_docconsultora_seq'::regclass);


--
-- Name: idtarea_docempresa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_docempresa ALTER COLUMN idtarea_docempresa SET DEFAULT nextval('tarea_docempresa_idtarea_docempresa_seq'::regclass);


--
-- Name: idtipo_acta_reunion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_acta_reunion ALTER COLUMN idtipo_acta_reunion SET DEFAULT nextval('tipo_acta_reunion_idtipo_acta_reunion_seq'::regclass);


--
-- Name: idusuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario ALTER COLUMN idusuario SET DEFAULT nextval('usuario_idusuario_seq'::regclass);


--
-- Data for Name: accion_asoaciada_control; Type: TABLE DATA; Schema: public; Owner: -
--

COPY accion_asoaciada_control (idaccion_asociada_control, idempleado, nombre, recursos, plazo, idplan_tratamiento) FROM stdin;
\.


--
-- Name: accion_asoaciada_control_idaccion_asociada_control_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('accion_asoaciada_control_idaccion_asociada_control_seq', 1, false);


--
-- Data for Name: acta_reunion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY acta_reunion (idacta_reunion, idtipo_acta_reunion, asunto, duracion, lugar, descripcion, fecha) FROM stdin;
11	5	Acta de Reunion (06/10/2013 10:32:51)	6 meses			2013-10-06 10:32:51-05
14	2	Acta de Reunion (06/10/2013 05:54:54)				2013-10-06 05:54:54-05
13	3	Acta de Reunion (06/10/2013 04:37:56)				2013-10-06 04:37:56-05
15	2	Acta de Reunion (04/12/2013 01:13:38)	1 hora	Lambayeque	Reunion	2013-12-04 01:13:38-05
16	5	Acta de Reunion (01/04/2014 08:36:59)	\N	\N	\N	2014-04-01 08:36:59-05
17	5	Acta de Reunion (01/04/2014 08:37:00)	\N	\N	\N	2014-04-01 08:37:00-05
\.


--
-- Name: acta_reunion_idacta_reunion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('acta_reunion_idacta_reunion_seq', 17, true);


--
-- Data for Name: activo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY activo (idactivo, activo, uds, idactivo_categoria, propietario, idactivo_confidencialidad, idactivo_integridad, idactivo_disponibilidad, idactivo_importancia, ubicacion_fisica, version, descripcion, marca_modelo, fuente_distribuidor, idempresa, fecha) FROM stdin;
5	Prueba	0	\N		4	4	5	1						1	2013-12-04 11:40:38-05
1	servidores firewal	1	3	Informatica	4	4	4	2						1	2013-11-28 05:35:12-05
8	Activo (12/12/2013 11:35:49)	0	\N		1	1	1	1						1	2013-12-12 11:35:49-05
11	Activo (21/12/2013 11:41:51)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2013-12-21 11:41:51-05
12	Activo (21/12/2013 11:41:51)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2013-12-21 11:41:51-05
13	Activo (21/12/2013 11:41:53)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2013-12-21 11:41:53-05
14	Activo (21/12/2013 11:41:53)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2013-12-21 11:41:53-05
15	Activo (21/12/2013 11:41:59)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2013-12-21 11:41:59-05
16	Activo (21/12/2013 11:42:34)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2013-12-21 11:42:34-05
17	Activo (21/12/2013 11:42:35)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2013-12-21 11:42:35-05
19	Activo (01/04/2014 09:48:30)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-04-01 09:48:30-05
20	Activo (01/04/2014 09:48:30)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-04-01 09:48:30-05
21	Activo (01/04/2014 09:48:30)	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-04-01 09:48:30-05
\.


--
-- Data for Name: activo_categoria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY activo_categoria (idactivo_categoria, detalle) FROM stdin;
1	Información
2	Instalaciones
3	Personal
4	Procesos
5	Servicios
6	Comunicaciones
7	Soporte
8	Hardware
9	Software
10	Otros
\.


--
-- Name: activo_categoria_idactivo_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('activo_categoria_idactivo_categoria_seq', 10, true);


--
-- Data for Name: activo_confidencialidad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY activo_confidencialidad (idactivo_confidencialidad, detalle, color) FROM stdin;
1	Muy Bajo	rgb(144, 225, 101);
2	Bajo	rgb(223, 246, 149);
3	Medio	rgb(217, 128, 4);
4	Alto	rgb(250, 168, 123);
5	Muy Alto	rgb(230, 109, 116);
\.


--
-- Name: activo_confidencialidad_idactivo_confidencialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('activo_confidencialidad_idactivo_confidencialidad_seq', 5, true);


--
-- Data for Name: activo_disponibilidad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY activo_disponibilidad (idactivo_disponibilidad, detalle, color) FROM stdin;
1	Muy Bajo	rgb(144, 225, 101);
4	Alto	rgb(250, 168, 123);
5	Muy Alto	rgb(230, 109, 116);
2	Bajo	rgb(223, 246, 149);
3	Medio	rgb(250, 212, 145);
\.


--
-- Name: activo_disponibilidad_idactivo_disponibilidad_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('activo_disponibilidad_idactivo_disponibilidad_seq', 5, true);


--
-- Name: activo_idactivo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('activo_idactivo_seq', 21, true);


--
-- Data for Name: activo_importancia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY activo_importancia (idactivo_importancia, detalle, color) FROM stdin;
1	Muy Alto	rgb(230, 109, 116);
2	Alto	rgb(250, 168, 123);
3	Bajo	rgb(223, 246, 149);
\.


--
-- Name: activo_importancia_idactivo_importancia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('activo_importancia_idactivo_importancia_seq', 3, true);


--
-- Data for Name: activo_integridad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY activo_integridad (idactivo_integridad, detalle, color) FROM stdin;
1	Muy Bajo	rgb(144, 225, 101);
2	Bajo	rgb(223, 246, 149);
3	Medio	rgb(217, 128, 4);
4	Alto	rgb(250, 168, 123);
5	Muy Alto	rgb(230, 109, 116);
\.


--
-- Name: activo_integridad_idactivo_integridad_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('activo_integridad_idactivo_integridad_seq', 5, true);


--
-- Data for Name: amenaza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY amenaza (idamenaza, idactivo, amenaza, vulnerabilidad, comentario, idamenaza_impacto, idamenaza_importancia, idamenaza_probabilidad, idamenaza_riesgo, fecha) FROM stdin;
1	1	[I.1] Fuego	Sistemas anti incendios deficientes o inexistentes. Existencia de material inflamable (papel, etc).	\N	1	2	3	4	2013-11-30 10:44:45.444-05
9	5	Amenaza (09/12/2013 04:25:44)	\N	\N	5	5	4	4	2013-12-09 16:25:45.016-05
14	1	Amenaza (17/12/2013 10:36:21)	\N	\N	\N	\N	\N	\N	2013-12-17 10:36:21.922-05
3	\N	Amenaza (30/11/2013 11:08:38)	\N	\N	\N	\N	\N	\N	2013-11-30 11:08:38.951-05
8	\N	Amenaza (30/11/2013 11:26:24)	\N	\N	4	2	4	4	2013-11-30 11:26:24.661-05
7	\N	Amenaza (30/11/2013 11:26:24)	\N	\N	3	3	3	4	2013-11-30 11:26:24.468-05
10	\N	Amenaza (12/12/2013 11:26:05)	\N	\N	\N	\N	\N	\N	2013-12-12 11:26:05.483-05
11	\N	Amenaza (12/12/2013 11:26:12)	\N	\N	\N	\N	\N	\N	2013-12-12 11:26:12.512-05
16	5	Amenaza (01/04/2014 09:49:52)	\N	\N	\N	\N	\N	\N	2014-04-01 21:49:52.592-05
17	5	Amenaza (01/04/2014 09:49:52)	\N	\N	\N	\N	\N	\N	2014-04-01 21:49:52.812-05
18	5	Amenaza (01/04/2014 09:49:52)	\N	\N	\N	\N	\N	\N	2014-04-01 21:49:52.996-05
19	5	Amenaza (01/04/2014 09:49:53)	\N	\N	\N	\N	\N	\N	2014-04-01 21:49:53.179-05
20	5	Amenaza (01/04/2014 09:49:53)	\N	\N	\N	\N	\N	\N	2014-04-01 21:49:53.362-05
21	5	Amenaza (01/04/2014 09:49:53)	\N	\N	\N	\N	\N	\N	2014-04-01 21:49:53.545-05
\.


--
-- Name: amenaza_idamenaza_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('amenaza_idamenaza_seq', 21, true);


--
-- Data for Name: amenaza_impacto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY amenaza_impacto (idamenaza_impacto, detalle, color) FROM stdin;
1	Muy Bajo	rgb(144, 225, 101);
2	Bajo	rgb(223, 246, 149);
3	Medio	rgb(250, 212, 145);
4	Alto	rgb(250, 168, 123);
5	Muy Alto	rgb(230, 109, 116);
\.


--
-- Name: amenaza_impacto_idamenaza_impacto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('amenaza_impacto_idamenaza_impacto_seq', 5, true);


--
-- Data for Name: amenaza_importancia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY amenaza_importancia (idamenaza_importancia, detalle, color) FROM stdin;
1	Muy Bajo	rgb(144, 225, 101);
2	Bajo	rgb(223, 246, 149);
3	Medio	rgb(250, 212, 145);
4	Alto	rgb(250, 168, 123);
5	Muy Alto	rgb(230, 109, 116);
\.


--
-- Name: amenaza_importancia_idamenaza_importancia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('amenaza_importancia_idamenaza_importancia_seq', 5, true);


--
-- Data for Name: amenaza_probabilidad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY amenaza_probabilidad (idamenaza_probabilidad, detalle, color) FROM stdin;
1	Muy Bajo	rgb(144, 225, 101);
2	Bajo	rgb(223, 246, 149);
3	Medio	rgb(250, 212, 145);
4	Alto	rgb(250, 168, 123);
5	Muy Alto	rgb(230, 109, 116);
\.


--
-- Name: amenaza_propabilidad_idamenaza_propabilidad_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('amenaza_propabilidad_idamenaza_propabilidad_seq', 5, true);


--
-- Data for Name: amenaza_riesgo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY amenaza_riesgo (idamenaza_riesgo, detalle, color) FROM stdin;
1	Muy Bajo	rgb(144, 225, 101);
2	Bajo	rgb(223, 246, 149);
3	Medio	rgb(250, 212, 145);
4	Alto	rgb(250, 168, 123);
5	Muy Alto	rgb(230, 109, 116);
\.


--
-- Name: amenaza_riesgo_idamenaza_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('amenaza_riesgo_idamenaza_riesgo_seq', 5, true);


--
-- Data for Name: amenazas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY amenazas (idamenazas, codigo, detalle, idactivo_categoria) FROM stdin;
1	A.10	Alteración de secuencia	\N
2	A.12	Análisis de tráfico	\N
3	A.14	Intercepción de información (escucha)	\N
4	A.16	Introducción de falsa información	\N
\.


--
-- Name: amenazas_idamenazas_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('amenazas_idamenazas_seq', 4, true);


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: -
--

COPY area (idarea, iddepartamento, nombre) FROM stdin;
1	1	a
\.


--
-- Name: area_idarea_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('area_idarea_seq', 1, true);


--
-- Data for Name: asistentes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY asistentes (idempleado, idacta_reunion, responsable_acta) FROM stdin;
1	11	t
4	14	f
1	14	f
2	15	t
\.


--
-- Data for Name: asuntos_pendientes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY asuntos_pendientes (idasuntos_pendientes, idacta_reunion, accion, idempleado, plazo) FROM stdin;
2	11	asdasdasdasd	1	2
\.


--
-- Name: asuntos_pendientes_idasuntos_pendientes_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('asuntos_pendientes_idasuntos_pendientes_seq', 2, true);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cargo (idcargo, idarea, nombre) FROM stdin;
1	1	a
\.


--
-- Name: cargo_idcargo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cargo_idcargo_seq', 1, true);


--
-- Name: cobit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cobit_id_seq', 183, true);


--
-- Data for Name: comite; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comite (idinicio_alcance, idcargo) FROM stdin;
14	1
11	1
15	1
\.


--
-- Data for Name: competencia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY competencia (idcompetencia, idcargo, detalle) FROM stdin;
2	1	Negociacion
\.


--
-- Name: competencia_idcompetencia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('competencia_idcompetencia_seq', 2, true);


--
-- Data for Name: conclusiones_acta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY conclusiones_acta (idconclusiones_acta, idacta_reunion, nombre, descripcion) FROM stdin;
1	11	Establecimiento del alcance	 
2	11	Conclusiones tratadas	 
\.


--
-- Name: conclusiones_acta_idconclusiones_acta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('conclusiones_acta_idconclusiones_acta_seq', 4, true);


--
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contacto (idcontacto, idsuministrador, nombre, cargo, telefono, email, comentario) FROM stdin;
\.


--
-- Name: contacto_idcontacto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contacto_idcontacto_seq', 1, true);


--
-- Data for Name: contrato; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contrato (idcontrato, idsuministrador, detalle, inicio, fin, soporte) FROM stdin;
\.


--
-- Name: contrato_idcontrato_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contrato_idcontrato_seq', 1, true);


--
-- Data for Name: control; Type: TABLE DATA; Schema: public; Owner: -
--

COPY control (idcontrol, idamenaza, fecha, plazos, "fechaInicio", "fechaFin", costo, idempleado, control) FROM stdin;
1	1	2013-11-30 12:32:33.46-05	2	\N	\N	0,00 €	\N	Control 1
2	1	2013-11-30 13:13:46.357-05	0	2013-11-01 00:00:00-05	2013-12-31 00:00:00-05	15.000,00 €	\N	Control 2
4	8	2013-11-30 13:26:26.624-05	0	2013-11-01 00:00:00-05	2014-01-26 00:00:00-05	200,00 €	4	Control
5	1	2013-11-30 13:27:36.276-05	0	2013-11-05 00:00:00-05	2013-11-14 00:00:00-05	100,00 €	4	Control 3
6	1	2013-11-30 13:28:31.755-05	0	2013-11-07 00:00:00-05	2013-11-22 00:00:00-05	100,00 €	2	Control 4
8	1	2013-12-23 01:03:22.987-05	0	\N	\N	10,00 €	\N	\N
\.


--
-- Name: control_idcontrol_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('control_idcontrol_seq', 8, true);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY departamento (iddepartamento, idsucursal, nombre) FROM stdin;
1	1	a
\.


--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('departamento_iddepartamento_seq', 1, true);


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY departamentos (idinicio_alcance, iddepartamento) FROM stdin;
14	1
11	1
\.


--
-- Data for Name: diagrama; Type: TABLE DATA; Schema: public; Owner: -
--

COPY diagrama (iddiagrama, extension, fecha, archivo, descripcion, idacta_reunion, peso) FROM stdin;
6	png	2013-10-11 01:34:57.325-05	D_11_10_2013_01_34_57__final.png	22	14	3512.0000
\.


--
-- Name: diagrama_iddiagrama_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('diagrama_iddiagrama_seq', 6, true);


--
-- Data for Name: documentacion_acta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documentacion_acta (iddocumentacion_acta, idacta_reunion, nombre, entrego, referencia) FROM stdin;
2	11	Política de Seguridad		
\.


--
-- Name: documentacion_acta_iddocumentacion_acta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('documentacion_acta_iddocumentacion_acta_seq', 2, true);


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: -
--

COPY empleado (idempleado, idcargo, nombres, apellidos, dni, idempresa) FROM stdin;
2	1	Jose	Torres	15249875	1
1	\N	aaa	bbb	12345678	1
4	1	Gustavo Tomas	Quispe Ugarte	12456985	1
\.


--
-- Name: empleado_idempleado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('empleado_idempleado_seq', 4, true);


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY empresa (idempresa, nombre, ruc, detalle, "fechaRegistro") FROM stdin;
1	AAAAA	12345678911	\N	2013-10-06 09:00:12.957-05
\.


--
-- Name: empresa_idempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('empresa_idempresa_seq', 1, true);


--
-- Data for Name: gap; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gap (id, id_padre, detalle, indice, estado, observacion, aplica, control) FROM stdin;
2	1	Política de Seguridad de la Información	5.1	0	\N	0	f
5	\N	ASPECTOS ORGANIZATIVOS DE LA SEGURIDAD DE LA INFORMACIÓN	6	0	\N	0	f
6	5	Organización Interna	6.1	0	\N	0	f
7	5	Tercero	6.2	0	\N	0	f
18	\N	GESTIÓN DE ACTIVOS	7	0	\N	0	f
19	18	Responsabilidad sobre los activos	7.1	0	\N	0	f
20	18	Clasificación de la información	7.2	0	\N	0	f
26	\N	SEGURIDAD LIGADA A LOS RECURSOS HUMANOS	8	0	\N	0	f
27	26	Antes del empleo	8.1	0	\N	0	f
28	26	Durante el empleo	8.2	0	\N	0	f
39	\N	SEGURIDAD FÍSICA Y AMBIENTAL	9	0	\N	0	f
40	39	Áreas seguras	9.1	0	\N	0	f
41	39	Seguridad de los equipos	9.2	0	\N	0	f
55	\N	GESTIÓN DE COMUNICACIONES Y OPERACIONES	10	0	\N	0	f
56	55	Responsabilidades y procedimientos de operación	10.1	0	\N	0	f
57	55	Gestión de la provisión de servicios por terceros	10.2	0	\N	0	f
58	55	Planificación y aceptación del sistema	10.3	0	\N	0	f
60	55	Copias de seguridad	10.5	0	\N	0	f
61	55	Gestión de la seguridad de las redes	10.6	0	\N	0	f
62	55	Manipulación de los soportes	10.7	0	\N	0	f
63	55	Intercambio de información	10.8	0	\N	0	f
64	55	Servicios de comercio electrónico	10.9	0	\N	0	f
65	55	Supervisión	10.10	0	\N	0	f
8	6	Compromiso de la Dirección con la seguridad de la información	6.1.1	2	falta aprovacion	0	t
9	6	Coordinación de la seguridad de la Información	6.1.2	1		2	t
11	6	Proceso de autorizacion de recursos para el procesado de la información	6.1.4	1	\N	2	t
13	6	Contacto con las autoridades	6.1.6	1	\N	1	t
14	6	Revisión independiente de la seguridad de la información	6.1.8	0	\N	0	t
15	7	Identificación de los riesgos derivados del acceso de terceros	6.2.1	0	\N	0	t
16	7	Tratamiento de la seguridad en la relación con los clientes	6.2.2	0	\N	0	t
17	7	Tratamiento de la seguridad en contratos con terceros	6.2.3	0	\N	0	t
21	19	Inventario de activos	7.1.1	0	\N	0	t
22	19	Propiedad de los activos	7.1.2	0	\N	0	t
23	19	Uso aceptable de los activos	7.1.3	0	\N	0	t
24	20	Directrices de clasificación	7.2.1	0	\N	0	t
25	20	Etiquetado y manipulado de la información	7.2.2	0	\N	0	t
30	27	Funciones y responsabilidades	8.1.1	0	\N	0	t
31	27	Investigación de antecedentes	8.1.2	0	\N	0	t
32	27	Términos y condiciones de contratación	8.1.3	0	\N	0	t
33	28	Responsabilidades de la Dirección	8.2.1	1	\N	0	t
35	28	Proceso disciplinario	8.2.3	2	\N	0	t
36	29	Responsabilidad del cese o cambio	8.3.1	1	\N	0	t
37	29	Devolución de activos	8.3.2	2	\N	0	t
38	29	Retirada de los de derechos de acceso	8.3.3	3	\N	0	t
42	40	Perímetro de seguridad física	9.1.1	0	\N	0	t
45	40	Protección contra las amenazas externas y de origen ambiental	9.1.4	3	\N	0	t
46	40	Trabajo en áreas seguras	9.1.5	1	\N	0	t
70	57	Provisión de servicios	10.2.1	1	\N	0	t
47	40	Áreas de acceso público y de carga y descarga	9.1.6	0	\N	0	t
48	41	Emplazamiento y protección de equipos	9.2.1	0	\N	0	t
49	41	Instalación de suministro	9.2.2	0	\N	0	t
50	41	Seguridad del cableado	9.2.3	0	\N	0	t
51	41	Mantenimiento de los equipos	9.2.4	0	\N	0	t
53	41	Reutilizacion o retirada segura de equipos	9.2.6	0	\N	0	t
54	41	Retirada de materiales propiedad de la empresa	9.2.7	0	\N	0	t
66	56	Documentación de los procedimientos de operación	10.1.1	0	\N	0	t
67	56	Gestión de cambios	10.1.2	0	\N	0	t
68	56	Segregación de tareas	10.1.3	0	\N	0	t
72	57	Gestión de cambios en los servicios prestados por terceros	10.2.3	3	\N	0	t
71	57	Supervision y revisión de los servicios prestados por terceros	10.2.2	0	\N	0	t
74	58	Aceptación del sistema	10.3.2	3	\N	0	t
73	58	Gestión de capacidades	10.3.1	0	\N	0	t
76	59	Controles contra el código descargado en el cliente	10.4.2	2	\N	0	t
75	59	Controles contra el código malicioso	10.4.1	0	\N	0	t
12	6	Acuerdos de confidencidalidad	6.1.5	3	\N	2	t
77	60	Copias de seguridad de la información	10.5.1	0	\N	0	t
78	61	Controles de red	10.6.1	0	\N	0	t
79	61	Seguridad de los servicios de red	10.6.2	0	\N	0	t
80	62	Gestión de soportes extraí­bles	10.7.1	0	\N	0	t
81	62	Retirada de soportes	10.7.2	0	\N	0	t
83	62	Seguridad de la documentación del sistema	10.7.4	0	\N	0	t
85	63	Acuerdos de intercambio	10.8.2	0	\N	0	t
86	63	Soportes físicos en tránsito	10.8.3	0	\N	0	t
87	63	Mensajería electrónica	10.8.4	0	\N	0	t
89	64	Comercio electrónico	10.9.1	0	\N	0	t
90	64	Transacciones en línea	10.9.2	0	\N	0	t
91	64	Información puesta a disposición pública	10.9.3	0	\N	0	t
92	65	Registro de auditorías	10.10.1	0	\N	0	t
93	65	Supervisión del uso del sistema	10.10.2	0	\N	0	t
96	65	Registro de fallos	10.10.5	0	\N	0	t
97	65	Sincronización del reloj	10.10.6	0	\N	0	t
44	40	Seguridad de oficinas, despachos e instalaciones	9.1.3	2	\N	0	t
99	98	Requisitos de negocio para el control de acceso	11.1	0	\N	0	f
98	\N	CONTRO DEL ACCESO	11	0	\N	0	f
100	98	Gestión de acceso de usuario	11.2	0	\N	0	f
101	98	Responsabilidades de usuario	11.3	0	\N	0	f
102	98	Control de acceso a la red	11.4	0	\N	0	f
1	\N	POLÍTICA DE SEGURIDAD	5	0	\N	0	f
29	26	Cese del empleo o cambio de puesto de trabajo	8.3	0	\N	0	f
59	55	Protección contra código malicioso y descargable	10.4	0	\N	0	f
104	98	Control de acceso a las aplicaciones y a la información	11.6	0	\N	0	f
105	98	Ordenadores portátiles y teletrabajo	11.7	0	\N	0	f
131	\N	ADQUISICIÓN,DESARROLLO Y MANTENIMIENTO DE LOS SISTEMAS DE INFORMACIÓN	12	0	\N	0	f
132	131	Requisitos de seguridad de los sistemas de información	12.1	0	\N	0	f
133	131	Tratamiento correcto de las aplicaciones	12.2	0	\N	0	f
134	131	Controles criptográficos	12.3	0	\N	0	f
135	131	Seguridad de los archivos de sistema	12.4	0	\N	0	f
137	131	Gestión de la vulnerabilidad técnica	12.6	0	\N	0	f
154	\N	GESTIÓN DE INCIDENTES EN LA SEGURIDAD DE LA INFORMACIÓN	13	0	\N	0	f
155	154	Notificación de eventos y puntos débiles de la seguridad de la información	13.1	0	\N	0	f
156	154	Gestión de incidentes de seguridad de la información y mejoras\r\n	13.2	0	\N	0	f
162	\N	GESTIÓN DE LA CONTINUIDAD DEL NEGOCIO	14	0	\N	0	f
169	\N	CUMPLIMIENTO	15	0	\N	0	f
170	169	Cumplimiento de los requisitos legales	15.1	0	\N	0	f
171	169	Cumplimiento de las políticas y normas de seguridad y cumplimiento técnico	15.2	0	\N	0	f
172	169	Consideraciones de las auditorías de los sistemas de información	15.3	0	\N	0	f
158	155	Notificación de puntos débiles de la seguridad	13.1.2	2	\N	0	t
69	56	Separación de los recursos de desarrollo, prueba y operación	10.1.4	0	\N	0	t
82	62	Procedimientos de manipulación de la información	10.7.3	0	\N	0	t
88	63	Sistemas de información empresariales	10.8.5	0	\N	0	t
94	65	Protección de la información de los registros	10.10.3	0	\N	0	t
95	65	Registros de administración y operación	10.10.4	0	\N	0	t
106	99	Política de control de acceso	11.1.1	2	\N	0	t
107	100	Registro de usuario	11.2.1	2	\N	0	t
108	100	Gestión de privilegios	11.2.2	1	\N	0	t
109	100	Gestión de contraseñas de usuario	11.2.3	1	\N	0	t
111	101	Uso de contraseña	11.3.1	0	\N	0	t
112	101	Equipo de usuario desatendido	11.3.2	2	\N	0	t
113	101	Polí­tica de puesto de trabajo despejado y pantalla limpia	11.3.3	3	\N	0	t
114	102	Política de uso de los servicios en red	11.4.1	3	\N	0	t
115	102	Autenticación de usuario para conexiones externas	11.4.2	2	\N	0	t
116	102	Identificación de equipos en las redes	11.4.3	1	\N	0	t
117	102	Diagnóstico remoto y protección de los puertos de configuración	11.4.4	1	\N	0	t
118	102	Segregación de las redes	11.4.5	3	\N	0	t
119	102	Control de la conexión a la red	11.4.6	0	\N	0	t
121	103	Procedimientos seguros de inicio de sesión	11.5.1	3	\N	0	t
122	103	Identificación y autenticación de usuario	11.5.2	0	\N	0	t
123	103	Sistema de gestión de contraseñas	11.5.3	0	\N	0	t
124	103	Uso de los recursos del sistema	11.5.4	0	\N	0	t
125	103	Desconexión automática de sesión	11.5.5	0	\N	0	t
126	103	Limitación del tiempo de conexión	11.5.6	0	\N	0	t
127	104	Restricción del acceso a la información	11.6.1	0	\N	0	t
130	105	Teletrabajo	11.7.2	0	\N	0	t
138	132	Análisis y especificación de los requisitos de seguridad	12.1.1	0	\N	0	t
139	133	Validación de los datos de entrada	12.2.1	0	\N	0	t
140	133	Control del procesamiento interno	12.2.2	0	\N	0	t
141	133	Integridad de los mensajes\r\n	12.2.3	0	\N	0	t
142	133	Validación de los datos de salida	12.2.4	0	\N	0	t
143	134	Política de uso de los controles criptográficos	12.3.1	0	\N	0	t
144	134	Gestión de claves	12.3.2	0	\N	0	t
147	135	Control de acceso al código fuente de los programas	12.4.3	0	\N	0	t
146	135	Protección de los datos de prueba del sistema	12.4.2	0	\N	0	t
148	136	Procedimientos de control de cambios	12.5.1	0	\N	0	t
150	136	Restricciones a los cambios en los paquetes de software	12.5.3	0	\N	0	t
151	136	Fugas de información	12.5.4	0	\N	0	t
152	136	Externalización del desarrollo de software	12.5.5	0	\N	0	t
153	137	Control de las vulnerabilidades técnicas	12.6.1	0	\N	0	t
157	155	Notificación de los eventos de seguridad de la información	13.1.1	0	\N	0	t
173	170	Identificación de la legislación aplicable	15.1.1	0		0	t
159	156	Responsabilidades y procedimientos	13.2.1	0	\N	0	t
160	156	Aprendizaje de los incidentes de seguridad de la información	13.2.2	0	\N	0	t
161	156	Recopilación de evidencias	13.2.3	0	\N	0	t
165	163	Continuidad del negocio y evaluación de riesgos	14.1.2	0	\N	0	t
166	163	Desarrollo e implantación de planes de continuidad que incluyan la seguridad de la información	14.1.3	0	\N	0	t
167	163	Marco de referencia para la planificación de la continuidad del negocio	14.1.4	0	\N	0	t
168	163	Pruebas, mantenimiento y reevaluación de planes de continuidad	14.1.5	0	\N	0	t
43	40	Controles físicos de entrada	9.1.2	1	\N	0	t
103	98	Control de acceso al sistema operativo	11.5	0	\N	0	f
136	131	Seguridad en los procesos de desarrollo y soporte	12.5	0	\N	0	f
163	162	Aspectos de seguridad de la información en la gestión de la continuidad del negocio	14.1	0	\N	0	f
34	28	Concienciación, formación y capacitación en seguridad de la información	8.2.2	1	\N	0	t
52	41	Seguridad de los equipos fuera de las instalaciones	9.2.5	0	\N	0	t
84	63	Políticas y procedimientos de intercambio de información	10.8.1	0	\N	0	t
110	100	Revisión de los derechos de acceso de usuario	11.2.4	0	\N	0	t
120	102	Control de encaminamiento (routing) de red	11.4.7	3	\N	0	t
128	104	Aislamiento de sistemas sensibles	11.6.2	0	\N	0	t
129	105	Ordenadores portátiles y comunicaciones móviles	11.7.1	0	\N	0	t
145	135	Control del software en explotación	12.4.1	0	\N	0	t
149	136	Revisión técnica de las aplicaciones tras efectuar cambios en el sistema operativo	12.5.2	0	\N	0	t
164	163	Inclusión de la seguridad de la información en el proceso de gestión de la continuidad del negocio	14.1.1	0	\N	0	t
174	170	Derechos de propiedad intelectual (DPI)	15.1.2	0	\N	0	t
175	170	Protección de los documentos de la organización	15.1.3	0	\N	0	t
176	170	Protección de datos y privacidad de la información personal	15.1.4	0	\N	0	t
177	170	Prevención del uso indebido de los recursos de tratamiento de la información	15.1.5	0	\N	0	t
178	170	Regulación de los controles criptográficos	15.1.6	0	\N	0	t
179	171	Cumplimiento de las políticas y normas de seguridad	15.2.1	0	\N	0	t
180	171	Comprobación del cumplimiento técnico	15.2.2	0	\N	0	t
181	172	Controles de auditoría de los sistemas de información	15.3.1	0	\N	0	t
183	6	Contacto con grupos de especial interés	6.1.7	2	\N	1	t
182	172	Protección de las herramientas de auditoría de los sistemas de información	15.3.2	0	\N	0	t
3	2	Documento de política de seguridad de la informacion	5.1.1	2	falta aprovacion2	2	t
4	2	Revisión de la política de seguridad de la información	5.1.2	3		2	t
10	6	Asignación de responsabilidades relativas a la seguridad de la información	6.1.3	2		0	t
\.


--
-- Data for Name: gap_bitacora; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gap_bitacora (idgap_bitacora, idgap, anterior, actual, fecha, campo) FROM stdin;
18	4			2013-10-24 21:23:32.488-05	observacion
19	4			2013-10-24 21:24:34.106-05	observacion
20	3	2	2	2013-10-24 21:24:35.398-05	aplica
21	4	0	2	2013-10-24 21:25:12.38-05	aplica
22	4	2	0	2013-10-24 21:25:28.391-05	aplica
23	4	2	0	2013-10-24 21:26:15.489-05	aplica
24	4	0	1	2013-10-24 21:26:22.87-05	aplica
25	4	1	2	2013-10-24 21:26:31.07-05	aplica
26	3	2	0	2013-10-24 21:30:29.469-05	estado
27	3	falta aprovacion	falta aprovacion2	2013-10-24 21:30:49.698-05	observacion
28	4			2013-10-24 21:30:50.224-05	observacion
29	4			2013-10-24 21:30:53.798-05	observacion
30	4			2013-10-24 21:31:00.404-05	observacion
31	4			2013-10-24 21:31:07.254-05	observacion
32	4			2013-10-24 21:31:32.048-05	observacion
33	3	falta aprovacion2	falta aprovacion2	2013-12-04 17:59:52.368-05	observacion
34	4			2013-12-04 17:59:56.377-05	observacion
35	8	falta aprovacion	falta aprovacion	2013-12-04 18:00:08.604-05	observacion
36	9			2013-12-04 18:00:09.924-05	observacion
37	10			2013-12-04 18:00:17.899-05	observacion
38	3	2	0	2013-12-04 18:01:48.297-05	aplica
39	3	falta aprovacion2	falta aprovacion2	2013-12-04 18:01:59.785-05	observacion
40	173			2013-12-04 18:03:14.153-05	observacion
43	3	falta aprovacion2	falta aprovacion2	2013-12-05 14:20:43.103-05	observacion
41	3	falta aprovacion2	falta aprovacion2	2013-12-05 14:20:43.103-05	observacion
44	3	falta aprovacion2	falta aprovacion2	2013-12-05 14:20:43.103-05	observacion
42	3	falta aprovacion2	falta aprovacion2	2013-12-05 14:20:43.103-05	observacion
45	4			2013-12-05 14:20:48.188-05	observacion
46	4			2013-12-05 14:20:48.238-05	observacion
47	4			2013-12-05 14:20:48.246-05	observacion
48	4			2013-12-05 14:20:48.255-05	observacion
49	3	falta aprovacion2	falta aprovacion2	2014-01-13 22:37:10.475-05	observacion
50	4	2	1	2014-01-13 22:37:11.222-05	aplica
51	4	1	2	2014-01-13 22:37:13.378-05	estado
52	4	2	3	2014-01-13 22:38:11.371-05	estado
53	4	1	0	2014-01-13 22:38:12.06-05	aplica
54	3	0	2	2014-01-14 20:15:16.105-05	aplica
55	4	0	2	2014-01-14 20:15:17.518-05	aplica
56	3	0	2	2014-01-14 20:15:19.139-05	estado
57	4			2014-01-14 20:15:21.629-05	observacion
58	12	0	2	2014-01-14 20:15:30.415-05	aplica
\.


--
-- Name: gap_bitacora_idgap_bitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('gap_bitacora_idgap_bitacora_seq', 58, true);


--
-- Data for Name: indicador_asociado; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicador_asociado (idindicador_asociado, detalle) FROM stdin;
1	No definida
2	Disponibilidad de ADSL
3	Calidad de distribucion
4	% de accesos fisicos no vigilados
\.


--
-- Name: indicador_asociado_idindicador_asociado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('indicador_asociado_idindicador_asociado_seq', 4, true);


--
-- Name: indicadore_idindicador_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('indicadore_idindicador_seq', 2, true);


--
-- Data for Name: indicadores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicadores (idindicador, detalle, estado, idempresa) FROM stdin;
1	Indicador 1	t	1
2	Indicador 2	t	1
\.


--
-- Data for Name: inicio_alcance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY inicio_alcance (idacta_reunion, nombre, alcance, descripcion, idsg, exclusion, ubicacion_organigrama, ubicacion_diagrama) FROM stdin;
13	Nuevo Inicio y Alcance 06/10/2013 08:29:17	\N	\N	\N	\N	\N	\N
11	Nuevo Inicio y Alcance 07/10/2013 12:04:11		-	1			
14	Nuevo Inicio y Alcance 06/10/2013 08:28:56	sin alcance		\N			
15	Nuevo Inicio y Alcance 04/12/2013 01:17:45	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: interfaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY interfaces (idinicio_alcance, idcargo) FROM stdin;
11	1
\.


--
-- Data for Name: localizacion_fisica; Type: TABLE DATA; Schema: public; Owner: -
--

COPY localizacion_fisica (idinicio_alcance, idarea) FROM stdin;
11	1
\.


--
-- Data for Name: objetivo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY objetivo (idobjetivo, idacta_reunion, objetivo, descripcion, fecha, idempleado) FROM stdin;
11	14	Objetivo del Negocio (10/10/2013 09:41:54)		2013-10-10 21:41:54.637-05	\N
10	14	Objetivo del Negocio (10/10/2013 09:41:54)	sin descripcion	2013-10-10 21:41:54.397-05	\N
12	13	Objetivo del Negocio (21/10/2013 12:04:48)		2013-10-21 12:04:48.399-05	\N
13	15	Objetivo del Negocio (04/12/2013 01:18:19)		2013-12-04 01:18:19.834-05	4
14	15	prueba	xxxxxxxxxxxxxxxx	2014-01-14 20:14:14.568-05	2
\.


--
-- Data for Name: objetivo_area_afectada; Type: TABLE DATA; Schema: public; Owner: -
--

COPY objetivo_area_afectada (idobjetivo, idarea) FROM stdin;
10	1
14	1
\.


--
-- Data for Name: objetivo_documentos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY objetivo_documentos (idobjetivo_documentos, idobjetivo, documento, extension, fecha, descripcion, peso) FROM stdin;
3	10	OBJDOC_11_10_2013_02_11_18__data.xlsx	xlsx	2013-10-11 02:11:18.398-05	11	8447.0000
\.


--
-- Name: objetivo_documentos_idobjetivo_documentos_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('objetivo_documentos_idobjetivo_documentos_seq', 3, true);


--
-- Data for Name: objetivo_especifico; Type: TABLE DATA; Schema: public; Owner: -
--

COPY objetivo_especifico (idobjetivo_especifico, idobjetivo, descripcion, idempleado, recursos, nombre) FROM stdin;
1	10	asdasdasd	1	asdasd	\N
2	10	SDASD	\N	ASD	\N
3	14	ddd	2		\N
\.


--
-- Name: objetivo_especifico_idobjetivo_especifico_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('objetivo_especifico_idobjetivo_especifico_seq', 3, true);


--
-- Name: objetivo_idobjetivo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('objetivo_idobjetivo_seq', 14, true);


--
-- Data for Name: obligacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY obligacion (idobligacion, idcargo, detalle) FROM stdin;
2	1	Documentacion del SGSI
\.


--
-- Name: obligacion_idobligacion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('obligacion_idobligacion_seq', 2, true);


--
-- Data for Name: organigrama; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organigrama (idorganigrama, extension, fecha, archivo, descripcion, idacta_reunion, peso) FROM stdin;
\.


--
-- Name: organigrama_idorganigrama_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('organigrama_idorganigrama_seq', 10, true);


--
-- Name: plan_seguimiento_acciones_asoc_idacciones_asociadas_control_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('plan_seguimiento_acciones_asoc_idacciones_asociadas_control_seq', 4, true);


--
-- Data for Name: plan_tratamiento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY plan_tratamiento (idplan_tratamiento, nombres, "controlSOA", idempleado, recursos, plazo, coste, observaciones) FROM stdin;
2	Nuevo Control Asociado - 08/01/2014 08:34:13	\N	\N	\N	\N	\N	\N
4	Nuevo Control Asociado - 08/01/2014 08:35:44	\N	\N	\N	\N	\N	\N
5	Nuevo Control Asociado - 08/01/2014 08:36:27	\N	\N	\N	\N	\N	\N
6	Nuevo Control Asociado - 08/01/2014 08:36:49	\N	\N	\N	\N	\N	\N
1	Nuevo Control Asociado - 08/01/2014 08:33:44	A	2	b	2014-01-05 00:00:00-05	2,00 €	c
3	Nuevo Control Asociado - 08/01/2014 08:34:13	soa	\N	\N	\N	\N	\N
7	Nuevo Control Asociado - 08/01/2014 08:37:03	no soa	\N	PC	\N	\N	\N
\.


--
-- Data for Name: plan_tratamiento_acciones_asociadas_control; Type: TABLE DATA; Schema: public; Owner: -
--

COPY plan_tratamiento_acciones_asociadas_control (idacciones_asociadas_control, nombre, idempleado, recursos, plazo, idplan_tratamiento) FROM stdin;
1	Accion 1	2	ninguno	2014-01-06 00:00:00-05	1
2	Accion N	2	PC	2014-01-18 00:00:00-05	7
3	Accion 2	4	PC, Papel	2014-02-15 00:00:00-05	1
4	Accion aa	4	A	2014-01-11 00:00:00-05	6
\.


--
-- Data for Name: plan_tratamiento_activos_repercutidos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY plan_tratamiento_activos_repercutidos (idplan_tratamiento, idactivo, fecha) FROM stdin;
1	14	2014-01-11 06:21:52.059-05
\.


--
-- Data for Name: plan_tratamiento_asociacion_amenazas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY plan_tratamiento_asociacion_amenazas (idplan_tratamiento, idamenaza, fecha) FROM stdin;
1	1	2014-01-11 09:12:25.149-05
1	8	2014-01-11 13:00:28.252-05
1	7	2014-01-11 13:00:28.28-05
\.


--
-- Data for Name: plan_tratamiento_control; Type: TABLE DATA; Schema: public; Owner: -
--

COPY plan_tratamiento_control (idplan_tratamiento, idgap, fecha) FROM stdin;
4	34	2014-01-11 12:10:33.601-05
4	85	2014-01-11 13:31:12.64-05
\.


--
-- Name: plan_tratamiento_idplan_tratamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('plan_tratamiento_idplan_tratamiento_seq', 7, true);


--
-- Data for Name: plan_tratamiento_indicadores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY plan_tratamiento_indicadores (idplan_tratamiento, idindicador) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY proyecto (idproyecto, idgap, tarea, completada, descripcion, inicio, fin) FROM stdin;
\.


--
-- Name: proyecto_idproyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('proyecto_idproyecto_seq', 1, false);


--
-- Data for Name: puntos_tratados; Type: TABLE DATA; Schema: public; Owner: -
--

COPY puntos_tratados (idpuntos_tratados, idacta_reunion, actividad, descripcion) FROM stdin;
1	11	Inicio de Proyecto	
2	11	Definicion de alcance	 
\.


--
-- Name: puntos_tratados_idpuntos_tratados_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('puntos_tratados_idpuntos_tratados_seq', 8, true);


--
-- Data for Name: responsables; Type: TABLE DATA; Schema: public; Owner: -
--

COPY responsables (idinicio_alcance, idempleado) FROM stdin;
11	1
15	4
14	4
\.


--
-- Data for Name: seguimiento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY seguimiento (idseguimiento, idsuministrador, usuario, fecha, descripcion) FROM stdin;
\.


--
-- Name: seguimiento_idseguimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seguimiento_idseguimiento_seq', 1, true);


--
-- Data for Name: sg; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sg (idsg, nombre) FROM stdin;
1	Sistema de Gestión de Seguridad de la Información PYMES
\.


--
-- Name: sg_idsg_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sg_idsg_seq', 1, true);


--
-- Data for Name: sla; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sla (idsla, idsuministrador, descripcion, nombre) FROM stdin;
\.


--
-- Name: sla_idsla_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sla_idsla_seq', 2, true);


--
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sucursal (idsucursal, idempresa, nombre, departamento, ciudad, direccion) FROM stdin;
1	1	a	\N	\N	\N
\.


--
-- Name: sucursal_idsucursal_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sucursal_idsucursal_seq', 1, true);


--
-- Data for Name: suministrador; Type: TABLE DATA; Schema: public; Owner: -
--

COPY suministrador (idsuministrador, idempresa, "RUC", razon_social, descripcion, idempleado, direccion, poblacion, provincia, pais, comentario, idindicador_asociado, estado) FROM stdin;
9	1	\N	Suministrador (04/12/2013 11:42:58)		\N	\N	\N	\N	\N	\N	1	f
\.


--
-- Name: suministrador_idsuministradores_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('suministrador_idsuministradores_seq', 10, true);


--
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tarea (idtarea, idgap, detalle, inicio, fin, completado, descripcion) FROM stdin;
2	2	Nueva Tarea	\N	\N	f	\N
1	2	Nueva Tarea	2012-10-20	2012-11-01	t	\N
3	2	Nueva Tarea	\N	\N	f	\N
4	2	Nueva Tarea	\N	\N	f	\N
5	2	Nueva Tarea	\N	\N	f	\N
6	2	Nueva Tarea	\N	\N	f	\N
7	2	Nueva Tarea	\N	\N	f	\N
8	2	Nueva Tarea2	2013-10-01	2013-10-11	f	
9	6	Nueva Tarea	\N	\N	f	\N
\.


--
-- Data for Name: tarea_docconsultora; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tarea_docconsultora (idtarea_docconsultora, idtarea, documento, fecha) FROM stdin;
\.


--
-- Name: tarea_docconsultora_idtarea_docconsultora_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tarea_docconsultora_idtarea_docconsultora_seq', 3, true);


--
-- Data for Name: tarea_docempresa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tarea_docempresa (idtarea_docempresa, idtarea, documento, fecha) FROM stdin;
\.


--
-- Name: tarea_docempresa_idtarea_docempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tarea_docempresa_idtarea_docempresa_seq', 3, true);


--
-- Name: tarea_idtarea_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tarea_idtarea_seq', 9, true);


--
-- Data for Name: tarea_responsable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tarea_responsable (idtarea, idempleado, fecha) FROM stdin;
1	1	2013-10-27 19:09:46.668-05
1	4	2013-10-27 19:13:12.191-05
\.


--
-- Data for Name: tipo_acta_reunion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipo_acta_reunion (idtipo_acta_reunion, nombre) FROM stdin;
1	Comité
2	Seguimiento
3	Soporte
4	Consultoría
5	No definido
\.


--
-- Name: tipo_acta_reunion_idtipo_acta_reunion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipo_acta_reunion_idtipo_acta_reunion_seq', 5, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usuario (idusuario, usuario, clave, activo, idempresa) FROM stdin;
1	admin	81dc9bdb52d04dc20036dbd8313ed055	t	1
\.


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('usuario_idusuario_seq', 1, true);


--
-- Name: pk_iatarea_idempleado_tarea_responsable; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_responsable
    ADD CONSTRAINT pk_iatarea_idempleado_tarea_responsable PRIMARY KEY (idtarea, idempleado);


--
-- Name: pk_id_cobit; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gap
    ADD CONSTRAINT pk_id_cobit PRIMARY KEY (id);


--
-- Name: pk_idaccione_asociada_control_accion_asociada_control; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accion_asoaciada_control
    ADD CONSTRAINT pk_idaccione_asociada_control_accion_asociada_control PRIMARY KEY (idaccion_asociada_control);


--
-- Name: pk_idacta_reunion; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acta_reunion
    ADD CONSTRAINT pk_idacta_reunion PRIMARY KEY (idacta_reunion);


--
-- Name: pk_idacta_reunion_inicio_alcance; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inicio_alcance
    ADD CONSTRAINT pk_idacta_reunion_inicio_alcance PRIMARY KEY (idacta_reunion);


--
-- Name: pk_idactivo_activo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo
    ADD CONSTRAINT pk_idactivo_activo PRIMARY KEY (idactivo);


--
-- Name: pk_idactivo_categoria_activo_categoria; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_categoria
    ADD CONSTRAINT pk_idactivo_categoria_activo_categoria PRIMARY KEY (idactivo_categoria);


--
-- Name: pk_idactivo_confidencialidad_activo_confidencialidad; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_confidencialidad
    ADD CONSTRAINT pk_idactivo_confidencialidad_activo_confidencialidad PRIMARY KEY (idactivo_confidencialidad);


--
-- Name: pk_idactivo_disponibilidad_activo_disponibilidad; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_disponibilidad
    ADD CONSTRAINT pk_idactivo_disponibilidad_activo_disponibilidad PRIMARY KEY (idactivo_disponibilidad);


--
-- Name: pk_idactivo_importancia_activo_importancia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_importancia
    ADD CONSTRAINT pk_idactivo_importancia_activo_importancia PRIMARY KEY (idactivo_importancia);


--
-- Name: pk_idactivo_integridad_activo_integridad; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo_integridad
    ADD CONSTRAINT pk_idactivo_integridad_activo_integridad PRIMARY KEY (idactivo_integridad);


--
-- Name: pk_idamenaza_amenaza; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza
    ADD CONSTRAINT pk_idamenaza_amenaza PRIMARY KEY (idamenaza);


--
-- Name: pk_idamenaza_impacto_amenaza_impacto; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_impacto
    ADD CONSTRAINT pk_idamenaza_impacto_amenaza_impacto PRIMARY KEY (idamenaza_impacto);


--
-- Name: pk_idamenaza_importancia_amenaza_importancia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_importancia
    ADD CONSTRAINT pk_idamenaza_importancia_amenaza_importancia PRIMARY KEY (idamenaza_importancia);


--
-- Name: pk_idamenaza_propabilidad_amenaza_propabilidad; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_probabilidad
    ADD CONSTRAINT pk_idamenaza_propabilidad_amenaza_propabilidad PRIMARY KEY (idamenaza_probabilidad);


--
-- Name: pk_idamenaza_riesgo_amenaza_riesgo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza_riesgo
    ADD CONSTRAINT pk_idamenaza_riesgo_amenaza_riesgo PRIMARY KEY (idamenaza_riesgo);


--
-- Name: pk_idamenazas_amenazas; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenazas
    ADD CONSTRAINT pk_idamenazas_amenazas PRIMARY KEY (idamenazas);


--
-- Name: pk_idarea_area; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY area
    ADD CONSTRAINT pk_idarea_area PRIMARY KEY (idarea);


--
-- Name: pk_idasociacionacciones_control; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_acciones_asociadas_control
    ADD CONSTRAINT pk_idasociacionacciones_control PRIMARY KEY (idacciones_asociadas_control);


--
-- Name: pk_idasuntos_pendientes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asuntos_pendientes
    ADD CONSTRAINT pk_idasuntos_pendientes PRIMARY KEY (idasuntos_pendientes);


--
-- Name: pk_idcargo_cargo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT pk_idcargo_cargo PRIMARY KEY (idcargo);


--
-- Name: pk_idcompetencia_competencia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY competencia
    ADD CONSTRAINT pk_idcompetencia_competencia PRIMARY KEY (idcompetencia);


--
-- Name: pk_idconclusiones_acta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY conclusiones_acta
    ADD CONSTRAINT pk_idconclusiones_acta PRIMARY KEY (idconclusiones_acta);


--
-- Name: pk_idcontacto_contacto; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacto
    ADD CONSTRAINT pk_idcontacto_contacto PRIMARY KEY (idcontacto);


--
-- Name: pk_idcontrato_contrato; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT pk_idcontrato_contrato PRIMARY KEY (idcontrato);


--
-- Name: pk_idcontrol_control; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY control
    ADD CONSTRAINT pk_idcontrol_control PRIMARY KEY (idcontrol);


--
-- Name: pk_iddepartamento_departamento; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT pk_iddepartamento_departamento PRIMARY KEY (iddepartamento);


--
-- Name: pk_iddiagrama_diagrama; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY diagrama
    ADD CONSTRAINT pk_iddiagrama_diagrama PRIMARY KEY (iddiagrama);


--
-- Name: pk_iddocumentacion_acta_documentacion_acta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentacion_acta
    ADD CONSTRAINT pk_iddocumentacion_acta_documentacion_acta PRIMARY KEY (iddocumentacion_acta);


--
-- Name: pk_idempleado_empleado; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT pk_idempleado_empleado PRIMARY KEY (idempleado);


--
-- Name: pk_idempleadoidacta_renuion_asistentes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asistentes
    ADD CONSTRAINT pk_idempleadoidacta_renuion_asistentes PRIMARY KEY (idempleado, idacta_reunion);


--
-- Name: pk_idempresa_empresa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT pk_idempresa_empresa PRIMARY KEY (idempresa);


--
-- Name: pk_idgap_bitacora_gap_bitacora; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gap_bitacora
    ADD CONSTRAINT pk_idgap_bitacora_gap_bitacora PRIMARY KEY (idgap_bitacora);


--
-- Name: pk_idindicador_asociado_indicador_asociado; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicador_asociado
    ADD CONSTRAINT pk_idindicador_asociado_indicador_asociado PRIMARY KEY (idindicador_asociado);


--
-- Name: pk_idindicador_indicador; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicadores
    ADD CONSTRAINT pk_idindicador_indicador PRIMARY KEY (idindicador);


--
-- Name: pk_idinicio_alcance_area_comite; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comite
    ADD CONSTRAINT pk_idinicio_alcance_area_comite PRIMARY KEY (idinicio_alcance, idcargo);


--
-- Name: pk_idinicio_alcance_area_localizacionfisica; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY localizacion_fisica
    ADD CONSTRAINT pk_idinicio_alcance_area_localizacionfisica PRIMARY KEY (idinicio_alcance, idarea);


--
-- Name: pk_idinicio_alcance_cargo_interfaces; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interfaces
    ADD CONSTRAINT pk_idinicio_alcance_cargo_interfaces PRIMARY KEY (idinicio_alcance, idcargo);


--
-- Name: pk_idinicio_alcance_departamento_departamentos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT pk_idinicio_alcance_departamento_departamentos PRIMARY KEY (idinicio_alcance, iddepartamento);


--
-- Name: pk_idinicio_alcance_empleado_responsables; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT pk_idinicio_alcance_empleado_responsables PRIMARY KEY (idinicio_alcance, idempleado);


--
-- Name: pk_idobjetivo_documentos_objetivo_documentos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_documentos
    ADD CONSTRAINT pk_idobjetivo_documentos_objetivo_documentos PRIMARY KEY (idobjetivo_documentos);


--
-- Name: pk_idobjetivo_especifico_objetivo_especifico; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT pk_idobjetivo_especifico_objetivo_especifico PRIMARY KEY (idobjetivo_especifico);


--
-- Name: pk_idobjetivo_idarea_objetivo_area_afectada; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_area_afectada
    ADD CONSTRAINT pk_idobjetivo_idarea_objetivo_area_afectada PRIMARY KEY (idobjetivo, idarea);


--
-- Name: pk_idobjetivo_objetivo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo
    ADD CONSTRAINT pk_idobjetivo_objetivo PRIMARY KEY (idobjetivo);


--
-- Name: pk_idobligacion_obligacion; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obligacion
    ADD CONSTRAINT pk_idobligacion_obligacion PRIMARY KEY (idobligacion);


--
-- Name: pk_idorganigrama_organigrama; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organigrama
    ADD CONSTRAINT pk_idorganigrama_organigrama PRIMARY KEY (idorganigrama);


--
-- Name: pk_idplan_tratamiento; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento
    ADD CONSTRAINT pk_idplan_tratamiento PRIMARY KEY (idplan_tratamiento);


--
-- Name: pk_idplan_tratamiento_control; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_control
    ADD CONSTRAINT pk_idplan_tratamiento_control PRIMARY KEY (idplan_tratamiento, idgap);


--
-- Name: pk_idplan_tratamiento_idamenaza; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_asociacion_amenazas
    ADD CONSTRAINT pk_idplan_tratamiento_idamenaza PRIMARY KEY (idplan_tratamiento, idamenaza);


--
-- Name: pk_idplantratamiento_idindicador_plantratamiento_indicador; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_indicadores
    ADD CONSTRAINT pk_idplantratamiento_idindicador_plantratamiento_indicador PRIMARY KEY (idplan_tratamiento, idindicador);


--
-- Name: pk_idproyecto_proyecto; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT pk_idproyecto_proyecto PRIMARY KEY (idproyecto);


--
-- Name: pk_idpuntos_tratados; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY puntos_tratados
    ADD CONSTRAINT pk_idpuntos_tratados PRIMARY KEY (idpuntos_tratados);


--
-- Name: pk_idseguimiento_seguimiento; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY seguimiento
    ADD CONSTRAINT pk_idseguimiento_seguimiento PRIMARY KEY (idseguimiento);


--
-- Name: pk_idsg_sg; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sg
    ADD CONSTRAINT pk_idsg_sg PRIMARY KEY (idsg);


--
-- Name: pk_idsla_sla; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sla
    ADD CONSTRAINT pk_idsla_sla PRIMARY KEY (idsla);


--
-- Name: pk_idsucursal; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT pk_idsucursal PRIMARY KEY (idsucursal);


--
-- Name: pk_idsuministrador_suministrador; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suministrador
    ADD CONSTRAINT pk_idsuministrador_suministrador PRIMARY KEY (idsuministrador);


--
-- Name: pk_idtarea_docconsultora_tarea; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_docconsultora
    ADD CONSTRAINT pk_idtarea_docconsultora_tarea PRIMARY KEY (idtarea_docconsultora);


--
-- Name: pk_idtarea_docempresa_tarea_docempresa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_docempresa
    ADD CONSTRAINT pk_idtarea_docempresa_tarea_docempresa PRIMARY KEY (idtarea_docempresa);


--
-- Name: pk_idtarea_tarea; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea
    ADD CONSTRAINT pk_idtarea_tarea PRIMARY KEY (idtarea);


--
-- Name: pk_idtipo_acta_reunion_tipo_acta_reunion; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_acta_reunion
    ADD CONSTRAINT pk_idtipo_acta_reunion_tipo_acta_reunion PRIMARY KEY (idtipo_acta_reunion);


--
-- Name: pk_idusuario_usuario; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_idusuario_usuario PRIMARY KEY (idusuario);


--
-- Name: pk_plan_tratamiento_activos_repercutidos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_activos_repercutidos
    ADD CONSTRAINT pk_plan_tratamiento_activos_repercutidos PRIMARY KEY (idplan_tratamiento, idactivo);


--
-- Name: uk_dni_empleado; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT uk_dni_empleado UNIQUE (dni);


--
-- Name: uk_ruc_empresa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT uk_ruc_empresa UNIQUE (ruc);


--
-- Name: uk_ruc_suministrador; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suministrador
    ADD CONSTRAINT uk_ruc_suministrador UNIQUE ("RUC");


--
-- Name: uk_usuario_usuario; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT uk_usuario_usuario UNIQUE (usuario);


--
-- Name: fk_id_cobit_cobit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gap
    ADD CONSTRAINT fk_id_cobit_cobit FOREIGN KEY (id_padre) REFERENCES gap(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_alcance_inicio_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inicio_alcance
    ADD CONSTRAINT fk_idacta_reunion_alcance_inicio_acta_reunion FOREIGN KEY (idacta_reunion) REFERENCES acta_reunion(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_asistentes_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asistentes
    ADD CONSTRAINT fk_idacta_reunion_asistentes_acta_reunion FOREIGN KEY (idacta_reunion) REFERENCES acta_reunion(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_asuntos_pendientes_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asuntos_pendientes
    ADD CONSTRAINT fk_idacta_reunion_asuntos_pendientes_acta_reunion FOREIGN KEY (idacta_reunion) REFERENCES acta_reunion(idacta_reunion);


--
-- Name: fk_idacta_reunion_conclusiones_acta_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY conclusiones_acta
    ADD CONSTRAINT fk_idacta_reunion_conclusiones_acta_acta_reunion FOREIGN KEY (idacta_reunion) REFERENCES acta_reunion(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_diagrama_inicio_alcance; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY diagrama
    ADD CONSTRAINT fk_idacta_reunion_diagrama_inicio_alcance FOREIGN KEY (idacta_reunion) REFERENCES inicio_alcance(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_documentacion_acta_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentacion_acta
    ADD CONSTRAINT fk_idacta_reunion_documentacion_acta_acta_reunion FOREIGN KEY (idacta_reunion) REFERENCES acta_reunion(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_objetivo_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo
    ADD CONSTRAINT fk_idacta_reunion_objetivo_acta_reunion FOREIGN KEY (idacta_reunion) REFERENCES acta_reunion(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_organigrama_inicio_alcance; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organigrama
    ADD CONSTRAINT fk_idacta_reunion_organigrama_inicio_alcance FOREIGN KEY (idacta_reunion) REFERENCES inicio_alcance(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idacta_reunion_puntos_tratados_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY puntos_tratados
    ADD CONSTRAINT fk_idacta_reunion_puntos_tratados_acta_reunion FOREIGN KEY (idacta_reunion) REFERENCES acta_reunion(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idactivo_amenaza_activo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza
    ADD CONSTRAINT fk_idactivo_amenaza_activo FOREIGN KEY (idactivo) REFERENCES activo(idactivo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idactivo_categoria_activo_activo_categoria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo
    ADD CONSTRAINT fk_idactivo_categoria_activo_activo_categoria FOREIGN KEY (idactivo_categoria) REFERENCES activo_categoria(idactivo_categoria) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idactivo_categoria_amenazas_activo_categoria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenazas
    ADD CONSTRAINT fk_idactivo_categoria_amenazas_activo_categoria FOREIGN KEY (idactivo_categoria) REFERENCES activo_categoria(idactivo_categoria) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idactivo_confidencialidad_activo_confidencialidad_activo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo
    ADD CONSTRAINT fk_idactivo_confidencialidad_activo_confidencialidad_activo FOREIGN KEY (idactivo_confidencialidad) REFERENCES activo_confidencialidad(idactivo_confidencialidad) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idactivo_importancia_activo_importancia_activo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo
    ADD CONSTRAINT fk_idactivo_importancia_activo_importancia_activo FOREIGN KEY (idactivo_importancia) REFERENCES activo_importancia(idactivo_importancia) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idactivo_integridad_activo_integridad_activo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo
    ADD CONSTRAINT fk_idactivo_integridad_activo_integridad_activo FOREIGN KEY (idactivo_integridad) REFERENCES activo_integridad(idactivo_integridad) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idactivo_plan_tratamiento_idactivo_activo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_activos_repercutidos
    ADD CONSTRAINT fk_idactivo_plan_tratamiento_idactivo_activo FOREIGN KEY (idactivo) REFERENCES activo(idactivo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idactivodisponibilidad_activo_disponibilidad_activo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo
    ADD CONSTRAINT fk_idactivodisponibilidad_activo_disponibilidad_activo FOREIGN KEY (idactivo_disponibilidad) REFERENCES activo_disponibilidad(idactivo_disponibilidad) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idamenaza_control_amenaza; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY control
    ADD CONSTRAINT fk_idamenaza_control_amenaza FOREIGN KEY (idamenaza) REFERENCES amenaza(idamenaza) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idamenaza_impacto_amenaza_amenaza_impacto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza
    ADD CONSTRAINT fk_idamenaza_impacto_amenaza_amenaza_impacto FOREIGN KEY (idamenaza_impacto) REFERENCES amenaza_impacto(idamenaza_impacto) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idamenaza_importancia_amenaza_amenaza_importancia; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza
    ADD CONSTRAINT fk_idamenaza_importancia_amenaza_amenaza_importancia FOREIGN KEY (idamenaza_importancia) REFERENCES amenaza_importancia(idamenaza_importancia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idamenaza_plan_tratamiento_asociaciado_amenaza_idamenaza_ame; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_asociacion_amenazas
    ADD CONSTRAINT fk_idamenaza_plan_tratamiento_asociaciado_amenaza_idamenaza_ame FOREIGN KEY (idamenaza) REFERENCES amenaza(idamenaza) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idamenaza_probabilidad_amenaza_amenaza_probabilidad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza
    ADD CONSTRAINT fk_idamenaza_probabilidad_amenaza_amenaza_probabilidad FOREIGN KEY (idamenaza_probabilidad) REFERENCES amenaza_probabilidad(idamenaza_probabilidad) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idamenaza_riesgo_amenaza_amenaza_riesgo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenaza
    ADD CONSTRAINT fk_idamenaza_riesgo_amenaza_amenaza_riesgo FOREIGN KEY (idamenaza_riesgo) REFERENCES amenaza_riesgo(idamenaza_riesgo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idarea_cargo_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT fk_idarea_cargo_area FOREIGN KEY (idarea) REFERENCES area(idarea) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idarea_localizacion_fisica_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY localizacion_fisica
    ADD CONSTRAINT fk_idarea_localizacion_fisica_area FOREIGN KEY (idarea) REFERENCES area(idarea) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idarea_objetivo_area_afectada_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_area_afectada
    ADD CONSTRAINT fk_idarea_objetivo_area_afectada_area FOREIGN KEY (idarea) REFERENCES area(idarea) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idcargo_comite_cargo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comite
    ADD CONSTRAINT fk_idcargo_comite_cargo FOREIGN KEY (idcargo) REFERENCES cargo(idcargo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idcargo_competencia_cargo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY competencia
    ADD CONSTRAINT fk_idcargo_competencia_cargo FOREIGN KEY (idcargo) REFERENCES cargo(idcargo) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_idcargo_empleado_cargo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT fk_idcargo_empleado_cargo FOREIGN KEY (idcargo) REFERENCES cargo(idcargo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idcargo_interfaces_cargo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interfaces
    ADD CONSTRAINT fk_idcargo_interfaces_cargo FOREIGN KEY (idcargo) REFERENCES cargo(idcargo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idcargo_obligacion_cargo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obligacion
    ADD CONSTRAINT fk_idcargo_obligacion_cargo FOREIGN KEY (idcargo) REFERENCES cargo(idcargo) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_iddepartamento_area_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY area
    ADD CONSTRAINT fk_iddepartamento_area_departamento FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_iddepartamento_departamentos_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT fk_iddepartamento_departamentos_departamento FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_asistentes_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asistentes
    ADD CONSTRAINT fk_idempleado_asistentes_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_asociacion_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_acciones_asociadas_control
    ADD CONSTRAINT fk_idempleado_asociacion_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_asuntos_pendientes_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asuntos_pendientes
    ADD CONSTRAINT fk_idempleado_asuntos_pendientes_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_control_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY control
    ADD CONSTRAINT fk_idempleado_control_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_idempleado_objetivo_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo
    ADD CONSTRAINT fk_idempleado_objetivo_acta_reunion FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_objetivo_especifico_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT fk_idempleado_objetivo_especifico_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_plan_tratamiento_idempleado_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento
    ADD CONSTRAINT fk_idempleado_plan_tratamiento_idempleado_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_responsables_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT fk_idempleado_responsables_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempleado_suministrador_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suministrador
    ADD CONSTRAINT fk_idempleado_suministrador_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_idempleado_tarea_responsable_empleado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_responsable
    ADD CONSTRAINT fk_idempleado_tarea_responsable_empleado FOREIGN KEY (idempleado) REFERENCES empleado(idempleado) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_idempresa_activo_idempresa_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activo
    ADD CONSTRAINT fk_idempresa_activo_idempresa_empresa FOREIGN KEY (idempresa) REFERENCES empresa(idempresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempresa_empleado_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT fk_idempresa_empleado_empresa FOREIGN KEY (idempresa) REFERENCES empresa(idempresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempresa_indicador_idempresa_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicadores
    ADD CONSTRAINT fk_idempresa_indicador_idempresa_empresa FOREIGN KEY (idempresa) REFERENCES empresa(idempresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempresa_sucursal_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT fk_idempresa_sucursal_empresa FOREIGN KEY (idempresa) REFERENCES empresa(idempresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempresa_suministrador_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suministrador
    ADD CONSTRAINT fk_idempresa_suministrador_empresa FOREIGN KEY (idempresa) REFERENCES empresa(idempresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idempresa_usuario_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_idempresa_usuario_empresa FOREIGN KEY (idempresa) REFERENCES empresa(idempresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idgap_gap_bitacora_gap; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gap_bitacora
    ADD CONSTRAINT fk_idgap_gap_bitacora_gap FOREIGN KEY (idgap) REFERENCES gap(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_idgap_plan_tratamiento_control_gap; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_control
    ADD CONSTRAINT fk_idgap_plan_tratamiento_control_gap FOREIGN KEY (idgap) REFERENCES gap(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idgap_proyecto_gap; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT fk_idgap_proyecto_gap FOREIGN KEY (idgap) REFERENCES gap(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_idgap_tarea_gap; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea
    ADD CONSTRAINT fk_idgap_tarea_gap FOREIGN KEY (idgap) REFERENCES gap(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_idindicador_asociado_suministrador_indicador_asociado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suministrador
    ADD CONSTRAINT fk_idindicador_asociado_suministrador_indicador_asociado FOREIGN KEY (idindicador_asociado) REFERENCES indicador_asociado(idindicador_asociado) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_idindicador_plan_tratamiento_indicadores; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_indicadores
    ADD CONSTRAINT fk_idindicador_plan_tratamiento_indicadores FOREIGN KEY (idindicador) REFERENCES indicadores(idindicador) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idinicio_alcance_comite_inicio_alcance; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comite
    ADD CONSTRAINT fk_idinicio_alcance_comite_inicio_alcance FOREIGN KEY (idinicio_alcance) REFERENCES inicio_alcance(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idinicio_alcance_departamentos_inicio_alcance; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT fk_idinicio_alcance_departamentos_inicio_alcance FOREIGN KEY (idinicio_alcance) REFERENCES inicio_alcance(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idinicio_alcance_localizacion_fisica_inicio_alcance; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY localizacion_fisica
    ADD CONSTRAINT fk_idinicio_alcance_localizacion_fisica_inicio_alcance FOREIGN KEY (idinicio_alcance) REFERENCES inicio_alcance(idacta_reunion);


--
-- Name: fk_idinicio_alcance_responsables_inicio_alcance; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT fk_idinicio_alcance_responsables_inicio_alcance FOREIGN KEY (idinicio_alcance) REFERENCES inicio_alcance(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idobjetivo_area_afectada; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_area_afectada
    ADD CONSTRAINT fk_idobjetivo_area_afectada FOREIGN KEY (idobjetivo) REFERENCES objetivo(idobjetivo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idobjetivo_objetivo_documentos_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_documentos
    ADD CONSTRAINT fk_idobjetivo_objetivo_documentos_objetivo FOREIGN KEY (idobjetivo) REFERENCES objetivo(idobjetivo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idobjetivo_objetivo_especifico_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT fk_idobjetivo_objetivo_especifico_objetivo FOREIGN KEY (idobjetivo) REFERENCES objetivo(idobjetivo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idplan_tratamiento_accion_asociada_control_idplan_tratamient; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accion_asoaciada_control
    ADD CONSTRAINT fk_idplan_tratamiento_accion_asociada_control_idplan_tratamient FOREIGN KEY (idplan_tratamiento) REFERENCES plan_tratamiento(idplan_tratamiento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idplan_tratamiento_activos_repercutidos_idplan_tratamiento_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_activos_repercutidos
    ADD CONSTRAINT fk_idplan_tratamiento_activos_repercutidos_idplan_tratamiento_p FOREIGN KEY (idplan_tratamiento) REFERENCES plan_tratamiento(idplan_tratamiento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idplan_tratamiento_plan_tratamiento_indicador_plan_tratamien; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_indicadores
    ADD CONSTRAINT fk_idplan_tratamiento_plan_tratamiento_indicador_plan_tratamien FOREIGN KEY (idplan_tratamiento) REFERENCES plan_tratamiento(idplan_tratamiento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idplan_tratamiento_tratamiento_control_plan_tratamiento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_control
    ADD CONSTRAINT fk_idplan_tratamiento_tratamiento_control_plan_tratamiento FOREIGN KEY (idplan_tratamiento) REFERENCES plan_tratamiento(idplan_tratamiento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idplantratamiento_plan_tratamiento_asociacion_amenaza_idplan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_asociacion_amenazas
    ADD CONSTRAINT fk_idplantratamiento_plan_tratamiento_asociacion_amenaza_idplan FOREIGN KEY (idplan_tratamiento) REFERENCES plan_tratamiento(idplan_tratamiento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idplantratamiento_plantratamiento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plan_tratamiento_acciones_asociadas_control
    ADD CONSTRAINT fk_idplantratamiento_plantratamiento FOREIGN KEY (idplan_tratamiento) REFERENCES plan_tratamiento(idplan_tratamiento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idsg_inicio_alcance_sg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inicio_alcance
    ADD CONSTRAINT fk_idsg_inicio_alcance_sg FOREIGN KEY (idsg) REFERENCES sg(idsg) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idsucursal_departamento_sucursal; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT fk_idsucursal_departamento_sucursal FOREIGN KEY (idsucursal) REFERENCES sucursal(idsucursal) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idsuministrador_contacto_suministrador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacto
    ADD CONSTRAINT fk_idsuministrador_contacto_suministrador FOREIGN KEY (idsuministrador) REFERENCES suministrador(idsuministrador) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idsuministrador_contrato_suministrador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT fk_idsuministrador_contrato_suministrador FOREIGN KEY (idsuministrador) REFERENCES suministrador(idsuministrador) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idsuministrador_seguimiento_suministrador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY seguimiento
    ADD CONSTRAINT fk_idsuministrador_seguimiento_suministrador FOREIGN KEY (idsuministrador) REFERENCES suministrador(idsuministrador) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idsuministrador_sla_suministrador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sla
    ADD CONSTRAINT fk_idsuministrador_sla_suministrador FOREIGN KEY (idsuministrador) REFERENCES suministrador(idsuministrador) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idtarea_docconsultora_tarea_docconsultora_tarea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_docconsultora
    ADD CONSTRAINT fk_idtarea_docconsultora_tarea_docconsultora_tarea FOREIGN KEY (idtarea) REFERENCES tarea(idtarea) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idtarea_tarea_docempresa_tarea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_docempresa
    ADD CONSTRAINT fk_idtarea_tarea_docempresa_tarea FOREIGN KEY (idtarea) REFERENCES tarea(idtarea) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idtarea_tarea_responsable_tarea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarea_responsable
    ADD CONSTRAINT fk_idtarea_tarea_responsable_tarea FOREIGN KEY (idtarea) REFERENCES tarea(idtarea) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_idtipo_acta_reunion_acta_reunion_tipo_acta_reunion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acta_reunion
    ADD CONSTRAINT fk_idtipo_acta_reunion_acta_reunion_tipo_acta_reunion FOREIGN KEY (idtipo_acta_reunion) REFERENCES tipo_acta_reunion(idtipo_acta_reunion) ON UPDATE CASCADE;


--
-- Name: fk_inicio_alcance_interfaces_inicio_alcance; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interfaces
    ADD CONSTRAINT fk_inicio_alcance_interfaces_inicio_alcance FOREIGN KEY (idinicio_alcance) REFERENCES inicio_alcance(idacta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict DN7Boo3Eke5U2fepf6BcmS3W7C25VQbK4eCuyxuGuaL9Pbbn7pBPs9F6QWCiUrn

