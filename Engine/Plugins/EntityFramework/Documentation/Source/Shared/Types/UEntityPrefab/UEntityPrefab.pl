
[EXCERPT:UEntityPrefab]
# System Scene Graph

Scene Graph to nowy sposób tworzenia scen 3D i mechanik rozgrywki, który łączy tradycyjne przepływy pracy edytora gier z mocą i elastycznością skryptów Verse.

![Scene Graph pomaga tworzyć złożone światy z modułowych niestandardowych gotowców.](prefabs.png)

---

## Beta: Należy używać ostrożnie

System Scene Graph jest w fazie beta. Możesz wypróbować to w swoich projektach UEFN, a nawet publikować projekty, które z tego korzystają. Jednak system jest nadal aktywnie rozwijany, a wiele dostępnych przepływów pracy jest ograniczonych. 

Na przykład:

-   Współpraca w zespole. Elementy Scene Graph, takie jak jednostki i gotowce, są zapisywane na poziomie. Za każdym razem, gdy zmodyfikujesz jedną z nich, zmodyfikujesz zasób poziomu. Oznacza to, że jeśli używasz systemu kontroli wersji, takiego jak Unreal Revision Control lub Perforce, tylko jedna osoba jednocześnie może pracować nad poziomem.

-   Edytor gotowców oferuje tylko niewielki podzbiór funkcji edycji dostępnych w Edytorze Poziomu.

-   Możliwa jest utrata danych. Możesz pisać własne niestandardowe klasy Verse dla elementów Scene Graph, takich jak jednostki i komponenty. Następnie możesz dodawać instancje tych klas do poziomu w edytorze i dostosowywać ich dane. Jednak w niektórych przypadkach te instancje lub ich dane mogą zostać utracone, jeśli później usuniesz, przeniesiesz, zmienisz nazwę lub zmodyfikujesz klasy Verse albo jeśli zapiszesz poziom, gdy kod Verse nie skompiluje się pomyślnie.

Aby uzyskać więcej informacji o systemie Scene Graph, w tym bardziej szczegółową listę jego ograniczeń, zapoznaj się z dokumentacją online.

[VAR:ToolTipOverride]
Zasób gotowca jest szablonem jednostki wielokrotnego użytku. 
Możesz dostosowywać działanie tego przez dodawanie komponentów oraz rozszerzać funkcjonalność poprzez dodawanie podrzędnych jednostek.
Możesz przeciągać i upuszczać dowolną liczbę instancji gotowca na swoje poziomy
oraz dostosowywać każdą instancję indywidualnie. Aktualizacje wprowadzone później do zasobu gotowca są
automatycznie stosowane również do instancji.

Uwaga: system Scene Graph jest w fazie beta. Niektóre przepływy pracy są ograniczone,
szczególnie możliwość współpracy z wykorzystaniem kontroli wersji.
[/VAR]
[VAR:ToolTipFullLink]
scene-graph-in-unreal-editor-for-fortnite
[/VAR]
[VAR:BaseUrl]
UEFN
[/VAR]
[/EXCERPT:UEntityPrefab]