```vhdl
ENTITY multiplier IS
  GENERIC (WIDTH : INTEGER := 8);
  PORT ( 
    clk : IN STD_LOGIC;
    a, b : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    result : OUT STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE behavioral OF multiplier IS
  SIGNAL prod : UNSIGNED(2*WIDTH-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
  process (clk) 
  begin
    if rising_edge(clk) then
      prod <= UNSIGNED(a) * UNSIGNED(b);
    end if;
  end process; 
  result <= STD_LOGIC_VECTOR(prod);
END ARCHITECTURE;
```