within Buildings.Fluid.HeatExchangers.HeatPumps.AirToAir.BaseClasses.Examples;
model DXHeating "Test model for DXHeating"
  extends Modelica.Icons.Example;
  package Medium =
      Buildings.Media.Air;
  Modelica.Blocks.Sources.Ramp T1(
    startTime=600,
    duration=1200,
    height=15,
    offset=273.15 + 5) "Medium1 inlet temperature"
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.Ramp m1_flow(
    offset=0,
    duration=2400,
    startTime=900,
    height=0.15) "Medium1 mass flow rate"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Blocks.Sources.Ramp T2(
    startTime=600,
    duration=1200,
    offset=273.15 + 20,
    height=15) "Medium2 inlet temperature"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Sources.Ramp m2_flow(
    startTime=600,
    offset=0,
    duration=2400,
    height=0.00038) "Medium2 mass flow rate"
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Blocks.Sources.IntegerStep intSte(
    height=1,
    startTime=60,
    offset=0) "Stage change"
    annotation (Placement(transformation(extent={{0,60},{20,80}})));

  Buildings.Fluid.HeatExchangers.HeatPumps.AirToAir.BaseClasses.DXHeating dxHea(datHP=
        datHP, variableSpeedCoil=true,
        redeclare
      Buildings.Fluid.HeatExchangers.HeatPumps.AirToAir.BaseClasses.HeatingCapacity
                                                                                                   heaCap)
              annotation (Placement(transformation(extent={{40,0},{60,20}})));

 Modelica.Blocks.Sources.TimeTable speRat(table=[0.0,0.0; 900,0.25; 1800,0.50;
        2700,0.75]) "Speed ratio "
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Data.HPData                                                   datHP(
    nCooSta=1,
    heaSta={AirToAir.Data.BaseClasses.HeatingStage(
        spe=1800,
        nomVal=AirToAir.Data.BaseClasses.HeatingNominalValues(
          Q_flow_nominal=1838.7,
          COP_nominal=5,
          m1_flow_nominal=0.1661088),
        perCur=AirToAir.Data.BaseClasses.PerformanceCurve(
          capFunT={0.617474,-0.00245669,-1.87E-05,0.0254921,-1.01E-04,-1.09E-04},
          capFunFF1={1},
          EIRFunT={0.993257,0.0201512,7.72E-05,-0.0317207,0.000740649,-3.04E-04},
          EIRFunFF1={1},
          T1InMin=273.15 + 7,
          T1InMax=273.15 + 27,
          T2InMin=273.15 + 10,
          T2InMax=273.15 + 30,
          ff1Min=0,
          ff1Max=1))},
    nHeaSta=1,
    cooSta={AirToAir.Data.BaseClasses.CoolingStage(
        spe=1800,
        nomVal=AirToAir.Data.BaseClasses.CoolingNominalValues(
          Q_flow_nominal=-1877.9,
          COP_nominal=4,
          m1_flow_nominal=0.151008,
          SHR_nominal=0.75),
        perCur=AirToAir.Data.BaseClasses.PerformanceCurve(
          capFunT={1.43085,-0.0453653,0.00199378,-0.00805944,3.93E-05,-1.81E-04},
          capFunFF1={1},
          EIRFunT={1.43085,-0.0453653,0.00199378,-0.00805944,3.93E-05,-1.81E-04},
          EIRFunFF1={1},
          T1InMin=283.15,
          T1InMax=298.75,
          T2InMin=280.35,
          T2InMax=322.05,
          ff1Min=0.6,
          ff1Max=1.2))})
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
equation
  connect(intSte.y,dxHea. mode)     annotation (Line(
      points={{21,70},{30,70},{30,20},{39,20}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(speRat.y,dxHea. speRat)     annotation (Line(
      points={{-59,80},{-34,80},{-34,17.6},{39,17.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T1.y,dxHea. T[1])     annotation (Line(
      points={{-59,50},{-40,50},{-40,14.5},{39,14.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T2.y,dxHea. T[2])     annotation (Line(
      points={{-59,20},{-40,20},{-40,15.5},{39,15.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(m1_flow.y,dxHea. m_flow[1])     annotation (Line(
      points={{-59,-10},{-40,-10},{-40,11.9},{39,11.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(m2_flow.y,dxHea. m_flow[2])     annotation (Line(
      points={{-59,-40},{-40,-40},{-40,12.9},{39,12.9}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics),__Dymola_Commands(file=
"modelica://Buildings/Resources/Scripts/Dymola/Fluid/HeatExchangers/HeatPumps/BaseClasses/Examples/DXHeating.mos"
        "Simulate and plot"),
          Documentation(info="<html>
<p>
This example illustrates working of  
<a href=\"modelica://Buildings.Fluid.HeatExchangers.HeatPumps.BaseClasses.DXHeating\">
Buildings.Fluid.HeatExchangers.HeatPumps.BaseClasses.DXHeating</a>. 
</p>
</html>",
revisions="<html>
<ul>
<li>
Jan 12, 2013 by Kaustubh Phalak:<br>
First implementation. 
</li>
</ul>
</html>"));
end DXHeating;
