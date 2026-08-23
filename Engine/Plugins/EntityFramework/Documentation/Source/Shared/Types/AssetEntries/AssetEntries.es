
[EXCERPT:entity]
# Sistema de Scene Graph

Scene Graph constituye una nueva forma de crear escenas 3D y mecánicas de juego que combina los procesos de trabajo tradicionales de los editores de videojuegos con la potencia y la flexibilidad de la secuenciación de comandos de Verse.

![Scene Graph permite crear mundos complejos a partir de prefabricados modulares personalizados.](prefabs.png)

---

## En fase beta: utilízalo con precaución

El sistema de Scene Graph se encuentra en fase beta; es decir, puedes probarlo en tus proyectos de UEFN e incluso publicar proyectos que lo utilicen. No obstante, actualmente sigue en fase de desarrollo activo y muchos de sus procesos de trabajo disponibles son limitados. 

Por ejemplo, podría hacerse lo siguiente:

-   Colaboración en equipo. Los elementos de Scene Graph, como las entidades y los prefabricados, se guardan en el nivel. Cada vez que modificas uno de ellos, modificas el recurso del nivel. Esto significa que, si utilizas un sistema de control de versiones como Unreal Revision Control o Perforce, solo una persona puede trabajar en un nivel a la vez.

-   El editor de prefabricados solo ofrece una pequeña parte de las funciones de edición que ofrece el editor de niveles.

-   Posible pérdida de datos. Puedes crear tus propias clases personalizadas de Verse para elementos de Scene Graph, como entidades y componentes. A continuación, puedes añadir instancias de estas clases al nivel en el editor y personalizar sus datos. No obstante, en algunos casos, esas instancias o sus datos pueden perderse si más adelante eliminas, mueves, renombras o modificas las clases de Verse, o si guardas el nivel mientras el código Verse no se compila.

Para obtener más información sobre el sistema de Scene Graph, incluida una lista más detallada de sus limitaciones, consulta los documentos en línea.

[VAR:ToolTipOverride]
La entidad es la clase base de todos los objetos de Scene Graph.
Puedes personalizar su comportamiento añadiendo componentes, ampliarla agregando entidades hijo
y guardar tus entidades como recursos prefabricados reutilizables.

Cuidado: el sistema de Scene Graph se encuentra en fase beta. Algunos procesos de trabajo tienen limitaciones,
sobre todo en lo que respecta a la capacidad de colaborar mediante el control de versiones.
[/VAR]
[VAR:ToolTipFullLink]
scene-graph-in-unreal-editor-for-fortnite
[/VAR]
[VAR:BaseUrl]
UEFN
[/VAR]
[/EXCERPT:entity]