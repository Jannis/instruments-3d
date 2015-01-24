module base()
{
	// Base board
	color([1.0, 1.0, 1.0])
		cube([1500, 400, 20]);

	// Runners for router
	translate([10, 10, 20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);
	translate([990, 10, 20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);
	translate([10, 365, 20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);
	translate([990, 365, 20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);

	// Sockets at the bottom of the board
	translate([10, 10, -20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);
	translate([990, 10, -20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);
	translate([10, 365, -20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);
	translate([990, 365, -20])
		color([1.0, 1.0, 1.0])
		cube([500, 25, 25]);
}

module shell_holder()
{
	// Runners for drum shell
	translate([662.45, 100, 20])
		rotate(90)
		color([0.8, 0.6, 0.4])
		cube([200, 30, 80]);
	translate([867.5, 100, 20])
		rotate(90)
		color([0.8, 0.6, 0.4])
		cube([200, 30, 80]);

	// Wheel 1
	translate([682.45, 50, 60])
		rotate([0, 90, 0])
	cylinder(10, 25, 25, true);

	// Wheel 2
	translate([682.45, 350, 60])
		rotate([0, 90, 0])
	cylinder(10, 25, 25, true);

	// Wheel 3
	translate([817.55, 50, 60])
		rotate([0, 90, 0])
	cylinder(10, 25, 25, true);

	// Wheel 4
	translate([817.55, 350, 60])
		rotate([0, 90, 0])
	cylinder(10, 25, 25, true);	
}

module router_mount()
{
	// Runners
	translate([300, 35, 20])
		color([0.8, 0.6, 0.4])
		rotate(90)
		cube([330, 30, 80]);
	translate([1200, 35, 20])
		color([0.8, 0.6, 0.4])
		rotate(90)
		cube([330, 30, 80]);	

	// Mount board
	difference() {
		translate([270, 125, 100])
			color([0, 0, 0])
			cube([930, 150, 20]);

		// Hole for cutter head
		translate([750, 200, 110])
			cylinder(40, 25, 25, true);
	}
}

module shell()
{
	// Example drum shell (14"x6.5")
	d = 14 * 2.54 * 10;
	h = 6.5 * 2.54 * 10;

	translate([750, 200, d / 2 + 15])
	rotate([0, 90, 0])
	difference() {
		cylinder(h, d / 2, d / 2, true);
		cylinder(h + 20, d / 2 - 12, d / 2 - 12, true);
	}
}

base();
shell_holder();
router_mount();
shell();