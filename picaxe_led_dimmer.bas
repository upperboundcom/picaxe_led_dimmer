; Dims an LED based on a potentiomenter input
; Note that the adc input has an 8 resolution while the pwmduty output
; has 10 bit resolution

symbol potpin=1 ; ADC channel 1
symbol ledpin=c.2 ; led output pin
let w0=0;
main:
	do
		
		readadc potpin, b1
    
    ;; An attempt to implement the arduino map() function without a long int value

    ; divide input into 4 chunks
    let b2 = b1 / 4
    ; multiply the chunk by a fourth of 1024 (max possibly pwm duty output)
    let w2 = b2 * 256

    ; divide by one fourth of 256 (64) , the max adc input value

    let w3 = w2 / 64

    ; now re-muliply by 4 to get a final duty value
    let w0 = w3 * 4
    
		pwmout ledpin, 200, w0
	loop
	stop