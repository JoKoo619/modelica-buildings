within Buildings.Rooms.FLEXLAB.Data.Constructions.OpaqueConstructions.ExteriorConstructions;
record Construction2 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(final material={
    Buildings.HeatTransfer.Data.Solids.InsulationBoard(x=0.08255),
    Buildings.HeatTransfer.Data.Solids.Plywood(x=0.0127),
    Buildings.HeatTransfer.Data.Solids.GypsumBoard(x=0.01588)},
    final nLay = 4) "South wall in test bed X2"
    annotation(Documentation(info="<html>
    <p>
    This is a model of the external wall used in test bed X2.
    </p>
    </html>", revisions="<html>
<ul>
<li>
September 17, 2013, by Peter Grant:<br/>
First implementation.
</li>
</ul>
</html>"));
