import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.*;
import ghidra.program.model.symbol.*;

import java.util.Random;

public class AnalyzeCurlOffsets extends GhidraScript {

    @Override
    public void run() throws Exception {
        Listing listing = currentProgram.getListing();
        AddressSetView code = getCodeAddresses(listing);

        int randomOffset = getRandomOffset(code);
        int nextOffset = disassembleFromOffset(code, randomOffset);
        
        println("Random offset: " + randomOffset);
        println("Next offset after disassembly: " + nextOffset);
    }

    private AddressSetView getCodeAddresses(Listing listing) {
        AddressSet code = new AddressSet();
        FunctionIterator funcs = listing.getFunctions(true);
        while (funcs.hasNext()) {
            Function func = funcs.next();
            code.add(func.getBody());
        }
        return code;
    }

    private int getRandomOffset(AddressSetView code) {
        AddressRangeIterator iter = code.getAddressRanges();
        long totalLength = 0;
        while (iter.hasNext()) {
            totalLength += iter.next().getLength();
        }

        Random random = new Random();
        long randomPosition = (long) (random.nextDouble() * totalLength);

        long currentLength = 0;
        iter = code.getAddressRanges();
        while (iter.hasNext()) {
            AddressRange range = iter.next();
            currentLength += range.getLength();
            if (currentLength >= randomPosition) {
                return (int) (range.getMinAddress().getOffset() + (range.getLength() - (currentLength - randomPosition)));
            }
        }

        return -1; // Should not reach here
    }

    private int disassembleFromOffset(AddressSetView code, int offset) throws Exception {
        Address startAddr = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(offset);
        clearListing(startAddr, startAddr.add(100));

        disassemble(startAddr);

        InstructionIterator iter = currentProgram.getListing().getInstructions(startAddr, true);
        while (iter.hasNext()) {
            Instruction instr = iter.next();
            if (!instr.isFallthrough()) { 
                break;
            }
        }

        return (int) startAddr.getOffset();
    }
}
