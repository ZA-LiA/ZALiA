/// DC91_carry(inst id)


return (argument0.xl<global.pc.x-8) 
    || (global.pc.x-8<0 && argument0.xl>=0);
/*  DC91 can leave the carry set, so return is that carry (0 or 1).
    
    I set up a test in db_test_various_1a() to find out what 
    exactly leaves the carry set and if there were any scenarios 
    where this left the GOB caller facing away from PC.
    Only scenario, I think, it sets the wrong facingDir is when 
    the map page and XL are 0 for both PC & GOB.
    What scenarios leave the carry set was confusing so 
    I'm leaving this script to simulate the OG step by step.
*/





