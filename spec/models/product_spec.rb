RSpec.describe Product, instance_name: :product do
  let(:product) { build_stubbed(:product) }

  describe 'associations' do
    it 'defines these associations', :aggregate_failures do
      expect(product).to have_many(:ties_to_categories)
      expect(product).to have_many(:categories)
      expect(product).to have_many(:comments)
    end
  end

  describe 'validations' do
    describe '#validate_clothing_weight' do
      subject(:validating) { product.valid? }

      context 'when a product is a clothing item and exceeds weight limit' do
        let(:product) { build_stubbed(:product, :clothing, weight: 1500) }

        it 'adds a validation error' do
          expect { validating }.to(
            change { product.errors[:weight] }.to(['clothing may not weigh more than 1kg'])
          )
        end
      end

      context 'when a product is a clothing item, but does not exceed weight limit' do
        let(:product) { build_stubbed(:product, :clothing, weight: 100) }

        it 'does nothing' do
          expect { validating }.to(not_change { product.errors.messages })
        end
      end

      context 'when a product is a heavy non-clothing item' do
        let(:product) { build_stubbed(:product, :gym_gear, weight: 9000) }

        it 'does nothing' do
          expect { validating }.to(not_change { product.errors.messages })
        end
      end
    end
  end

  describe 'callbacks' do
    describe '#normalize_description (before_validation)' do
      subject(:callback_before_validation) { product.valid? }

      let(:product) { build_stubbed(:product, description: ' spaces  everywhere  ') }

      it 'squishes description' do
        expect { callback_before_validation }.to(
          change { product.description }.to('spaces everywhere')
        )
      end
    end

    describe '#log_new_product_creation (after_create_commit)', freeze_at: '2020-01-01 12:00' do
      subject(:callback_after_create_commit) { product.save! }

      let(:product) { build(:product, name: 'Pro Skis') }

      let(:mock_logger) { instance_double(Logger, debug: nil) }

      before do
        allow(Logger).to receive(:new) { mock_logger }
      end

      it 'writes debug message to special log' do
        callback_after_create_commit

        expect_logger_to_have_been_initialized
        expect_logging_to_have_occurred
      end

      def expect_logger_to_have_been_initialized
        expect(Logger).to(
          have_received(:new).with(Rails.root.join('log/product_creation.log')).once
        )
      end

      def expect_logging_to_have_occurred
        expect(mock_logger).to(
          have_received(:debug).with(
            /\ANew Product#\d+ 'Pro Skis' created at 2020-01-01 12:00/
          ).once
        )
      end
    end
  end
end
