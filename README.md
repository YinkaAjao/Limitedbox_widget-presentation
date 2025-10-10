# Limitedbox_widget-presentation
Presentation link: https://docs.google.com/presentation/d/1u4t7A-qsb0-pPOrlKjCrK2H8HGWOplibcTw2A_sAjog/edit?usp=sharing 

Limited box  is a widget that constrains the size of a child if it is unbounded by its parent. It is important to note that Limited box will only work when the size of the widget is unconstrained, if it constrained the limited box is useless.

The attributes of LimitedBox are:
maxWidth
Sets the maximum width the child can occupy if the incoming width constraints are unbounded.

maxHeight
Sets the maximum height the child can occupy if the incoming height constraints are unbounded.

Example 1 
In my first example the limited box imposes a limit on the height of a list view widget, it only kicks in when there are no other rulles about size.

Example 2
The second example consists of two row widget boxes. One is constrained by its parent and one isn't, which shows how the Limited box only functions on unconstrained children.

Example 3
The third and final exaple shows what happens when an unconstrained child is not constrained by a LimitedBox: The container tries to be infinitely big 

To run this app, simply input "Flutter run" in terminal and select a method to display.