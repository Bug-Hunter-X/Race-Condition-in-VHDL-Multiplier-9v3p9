```vhdl
ENTITY multiplier IS
  GENERIC (WIDTH : INTEGER := 8);
  PORT ( 
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    a, b : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    result : OUT STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE behavioral OF multiplier IS
  SIGNAL prod : UNSIGNED(2*WIDTH-1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL reg_result : STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
  process (clk, rst) 
  begin
    if rst = '1' then
      prod <= (OTHERS => '0');
      reg_result <= (OTHERS => '0');
    elsif rising_edge(clk) then
      prod <= UNSIGNED(a) * UNSIGNED(b);
      reg_result <= STD_LOGIC_VECTOR(prod);
    end if;
  end process; 
  result <= reg_result; 
END ARCHITECTURE;
```