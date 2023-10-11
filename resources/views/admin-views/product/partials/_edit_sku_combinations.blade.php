@if(count($combinations) > 0)
<table class="table table-bordered physical_product_show">
    <thead>
        <tr>
            <td class="text-center">
                <label for="" class="title-color">{{\App\CPU\translate('Variant')}}</label>
            </td>
            <td class="text-center">
                <label for="" class="title-color">{{\App\CPU\translate('Variant Price')}}</label>
            </td>
            <td class="text-center">
                <label for="" class="title-color">{{\App\CPU\translate('SKU')}}</label>
            </td>
            <td class="text-center">
                <label for="" class="title-color">{{\App\CPU\translate('Quantity')}}</label>
            </td>
        </tr>
    </thead>
    <tbody>
        @endif
        @foreach ($combinations as $key => $combination)
        <tr>
            <td>
                <label for="" class="control-label">{{ $combination['type'] }}</label>
                <input value="{{ $combination['type'] }}" name="type[]" class="d-none">
            </td>
            <td>
                <input type="number" name="price_{{ $combination['type'] }}" value="{{ \App\CPU\Convert::default($combination['price']) }}" min="0" step="0.01" class="form-control amount" required>
            </td>
            <td>
                <input type="text" name="sku_{{ $combination['type'] }}" value="{{ $combination['sku'] }}" class="form-control">
            </td>
            <td>
                <input type="number" onkeyup="update_qty()" name="qty_{{ $combination['type'] }}" value="{{ $combination['qty'] }}" min="1" max="100000" step="1" class="form-control quantity" required>
            </td>
        </tr>
        @endforeach

        <div class="card-body">
            <div class="row ">
                <div class="col-md-6 form-group physical_product_show">
                    <label class="title-color">{{ \App\CPU\translate('Suplier Name') }}</label>
                    <select class="js-example-basic-multiple form-control" name="supplier_id" onchange="valuesOfAll(this.value)">
                        <option selected> --- select option ---</option>
                        @foreach (\App\Model\SupplierManagement::get() as $x)
                        <option value="{{ $x->id }}">{{ $x->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="col-md-6 form-group" id="totalamount">
                    <div class="row">
                        <label class="title-color">
                            {{ \App\CPU\translate('Total Amount') }}</label>
                        <input type="number" min="1" value="0" id="totalInput" step="1" readonly name="total_purchase" class="form-control" required>
                    </div>
                    <div class="row">
                        <label class="title-color">
                            {{ \App\CPU\translate('Previous Due') }}</label>
                        <input type="number" min="1" value="0" id="previousDue" step="1" readonly class="form-control" required>
                    </div>
                    <div class="row">
                        <label class="title-color">
                            {{ \App\CPU\translate('Payable') }}</label>
                        <input type="number" min="1" value="0" id="payable" step="1" readonly class="form-control" required>
                    </div>
                    <div class="row">
                        <label class="title-color">
                            {{ \App\CPU\translate('Now Pay') }}</label>
                        <input type="number" min="1" id="nowpay" value="0" step="1" name="make_pay" class="form-control" required>
                    </div>
                    <div class="row">
                        <label class="title-color">
                            {{ \App\CPU\translate('current due') }}</label>
                        <input type="number" min="1" id="currentDue" value="0" step="1" readonly class="form-control" required>
                    </div>
                </div>
            </div>
        </div>
    </tbody>
</table>
<script>
    function valuesOfAll(selectedValue) {
        $.ajax({
            type: "GET",
            url: "{{ route('getSupplierData') }}",
            data: { supplier_id: selectedValue },
            success: function (data) {
                $("#previousDue").val(data.previous_due);
                updateTotal();
            },
            error: function () {
                alert("Error fetching data from the server.");
            }
        });
    }

    // Initialize these variables and input fields
    const amountInputs = document.querySelectorAll(".amount");
    const quantityInputs = document.querySelectorAll(".quantity");
    const totalInput = document.getElementById("totalInput");
    const previousDueInput = document.getElementById("previousDue");
    const payableInput = document.getElementById("payable");
    const nowPayInput = document.getElementById("nowpay");
    const currentDueInput = document.getElementById("currentDue");

    function updateTotal() {
        let grandTotal = 0;

        amountInputs.forEach((amountInput, index) => {
            const amount = parseFloat(amountInput.value) || 0;
            const quantity = parseFloat(quantityInputs[index].value) || 0;
            const rowTotal = amount * quantity;

            grandTotal += rowTotal;
        });

        totalInput.value = grandTotal.valueOf(); // Display the grand total with 2 decimal places
        const previousDue = parseFloat(previousDueInput.value) || 0;
        const total = grandTotal; // Fix to get the total
        const payable = total + previousDue;
        payableInput.value = payable.valueOf(); // Display payable with 2 decimal places
        const nowPay = parseFloat(nowPayInput.value) || 0;
        const currentDue = payable - nowPay;
        currentDueInput.value = currentDue.valueOf(); // Display current due with 2 decimal places
    }

    // Attach the event listeners
    // You should add "amount" and "quantity" classes to the relevant input elements
    // For example, <input class="amount" type="number"> and <input class="quantity" type="number">
    amountInputs.forEach((amountInput, index) => {
        amountInput.addEventListener("input", updateTotal);
        quantityInputs[index].addEventListener("input", updateTotal);
    });
    previousDueInput.addEventListener("input", updateTotal);
    nowPayInput.addEventListener("input", updateTotal);

    // Initialize the total on page load
    updateTotal();
</script>