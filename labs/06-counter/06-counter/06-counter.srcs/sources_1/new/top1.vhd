------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

  -- Internal clock enable
  signal s_en  : std_logic;
  -- Internal counter
  signal s_cnt : std_logic_vector(4 - 1 downto 0);

begin

  --------------------------------------------------------------------
  -- Instance (copy) of clock_enable entity
  clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 25000000
      )
      port map(
          clk   => --- WRITE YOUR CODE HERE
          reset => --- WRITE YOUR CODE HERE
          ce_o  => s_en
      );

  --------------------------------------------------------------------
  -- Instance (copy) of cnt_up_down entity
  bin_cnt0 : entity work.cnt_up_down
     generic map(
          --- WRITE YOUR CODE HERE
      )
      port map(
          --- WRITE YOUR CODE HERE
      );

  --------------------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  hex2seg : entity work.hex_7seg
      port map(
          hex_i    => s_cnt,
          seg_o(6) => CA,
          seg_o(5) => CB,
          seg_o(4) => CC,
          seg_o(3) => CD,
          seg_o(2) => CE,
          seg_o(1) => CF,
          seg_o(0) => CG
      );

  -- Connect one common anode to 3.3V
  AN <= b"1111_1110";

  -- Display counter values on LEDs
  LED(3 downto 0) <= s_cnt;

end architecture Behavioral;
