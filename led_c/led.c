#define GPNCON 0x7F008830
#define GPNDAT 0x7F008834

#define GPNCON_REG (*(volatile unsigned long *)GPNCON)
#define GPNDAT_REG (*(volatile unsigned long *)GPNDAT)

void light_led4(unsigned int delay)
{
	int i;

	GPNDAT_REG = (GPNDAT_REG & 0x3F );
	for(i=0; i<delay ; i++);
}

void dark_led4(unsigned int delay)
{
	int i;

	GPNDAT_REG = ( GPNDAT_REG | 0xFFFFFFFF );
	for(i=0; i<delay ; i++);
}

void enable_gpncon_output()
{
	GPNCON_REG = ( GPNCON_REG & 0xFFFCFFFF) | 0x1000;
}

int main(void)
{
	enable_gpncon_output();
	for(;;) {
		dark_led4(0xFFFF);
		light_led4(0xFFFF);
	}
	return 0;
}
