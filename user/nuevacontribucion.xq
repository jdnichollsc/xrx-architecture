xquery version "1.0";

let $id := util:uuid()

return
<Contribucion xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="contribucion.xsd">
    <id>{$id}</id>
    <Colaborador>
        <Nombre/>
        <Apellido/>
        <Rol/>
        <Entidad/>
        <Profesion/>
        <email/>
    </Colaborador>
    <Aporte/>
    <Fecha/>
    <Fase/>
    <Descripcion/>
    <Enlaces>
        <Enlace>
            <origen/>
            <tipo/>
        </Enlace>
    </Enlaces>
    <Proyecto/>
    <Adjuntos>
        <Adjunto>
            <Nombre/>
            <tipo/>
            <version/>
            <comentario/>
            <ubicacion/>
        </Adjunto>
    </Adjuntos>
</Contribucion>
